//
//  ArticleUseCase.swift
//  NewsFlash
//
//  Created by Grace couch on 12/05/2025.
//

import Foundation

class ArticleUseCase {
    let service = NewsAPIService()
    let articleManager: ArticlesManager
    let sourceManager: SourceManager

    init(articleManager: ArticlesManager, sourceManager: SourceManager) {
        self.articleManager = articleManager
        self.sourceManager = sourceManager
    }

    func getArticles(for sourceId: Set<String>) async throws(ArticleError) -> [Article] {
        do throws(APIError) {
            return try await service.getArticles(for: sourceManager.userSelectedSources).map { article in
                Article(source: article.source, author: article.author, title: article.title, description: article.description, url: article.url, urlToImage: article.urlToImage, publishedAt: article.publishedAt, content: article.content, isSaved: self.articleManager.savedArticles.contains(where: { $0.url == article.url }))
            }
        } catch(let error) {
            throw ArticleError.api(error)
        }
    }
}
