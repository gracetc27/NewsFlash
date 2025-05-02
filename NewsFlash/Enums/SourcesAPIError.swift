//
//  SourcesAPIError.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import Foundation

enum SourcesAPIError: LocalizedError, Equatable {
    case invalidSourcesURL
    case noSources
    case decodingSourcesFailed
    var errorDescription: String? {
        switch self {
        case .invalidSourcesURL:
            return "Invalid sources URL"
        case .noSources:
            return "No sources available"
        case .decodingSourcesFailed:
            return "Decoding sources failed"
        }
    }
}
