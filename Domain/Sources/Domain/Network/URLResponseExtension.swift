//
//  URLResponseExtension.swift
//  
//
//  Created by Jean paul Massoud on 2024-05-28.
//

import Foundation

extension URLResponse {

    internal var isOk: Bool {
        guard let httpResponse = self as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else { return false }
        return true
    }

    internal var status: Int? {
        guard let httpResponse = self as? HTTPURLResponse
        else { return nil }
        return httpResponse.statusCode
    }

    internal var prettyPrint: String {
        if let url = self.url,
            let status = self.status
        {
            return String("Status: \(status) for url: \(url)")
        } else {
            return self.description
        }
    }

}
