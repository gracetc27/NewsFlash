//
//  ArticleError.swift
//  NewsFlash
//
//  Created by Grace couch on 12/05/2025.
//

import Foundation

enum ArticleError: LocalizedError {
    case api(APIError)
    case articleManager
    var errorDescription: String? {
        switch self {
        case .api(let error):
            return error.errorDescription
        case .articleManager:
            return "Failed to load saved articles"
        }
    }
}
