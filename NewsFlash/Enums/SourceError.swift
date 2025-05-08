//
//  SourceError.swift
//  NewsFlash
//
//  Created by Grace couch on 08/05/2025.
//

import Foundation

enum SourceError: LocalizedError {
    case api(APIError)
    case sourceManager
    var errorDescription: String? {
        switch self {
        case .api(let error):
            return error.errorDescription
        case .sourceManager:
            return "Failed to load saved sources"
        }
    }
}
