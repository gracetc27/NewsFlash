//
//  ArticlesViewModel.swift
//  NewsFlash
//
//  Created by Grace couch on 06/05/2025.
//

import SwiftUI

@Observable
class ArticlesViewModel {
    private let articlesManager: ArticlesManager
    let sourceManager: SourceManager
    let service: NewsAPIService
    var articles: [Article] = []
    var showErrorAlert = false
    var error: APIError?

    init(articlesManager: ArticlesManager, sourceManager: SourceManager, service: NewsAPIService) {
        self.articlesManager = articlesManager
        self.sourceManager = sourceManager
        self.service = service
    }

    func getArticles() async {
        do {
            articles = try await service.getArticles(for: sourceManager.userSelectedSources)
        } catch {
            self.error = error
            showErrorAlert = true
        }
    }

    func saveArticle(_ article: Article) {
        guard article.isSaved == true else { return }
        articlesManager.savedArticles.append(article)
        }

    func removeSavedArticle(_ article: Article) {
        guard article.isSaved == false else { return }
        articlesManager.savedArticles.removeAll { $0.id == article.id }
    }
}
