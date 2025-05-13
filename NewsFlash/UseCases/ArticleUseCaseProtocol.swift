//
//  ArticleUseCaseProtocol.swift
//  NewsFlash
//
//  Created by Grace couch on 13/05/2025.
//
import Foundation

protocol ArticleUseCaseProtocol {
    func getArticles(for sourceId: Set<String>) async throws(ArticleError) -> [Article]
}
