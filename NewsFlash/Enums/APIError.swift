//
//  APIError.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import Foundation

enum APIError: LocalizedError, Equatable {
    case invalidURL
    case noData
    case decodingFailed
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data available"
        case .decodingFailed:
            return "Decoding failed"
        }
    }
}
