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
    let useCase: ArticleUseCaseProtocol
    var articles: [Article] = []
    var showErrorAlert = false
    var error: ArticleError?

    init(articlesManager: ArticlesManager, sourceManager: SourceManager, useCase: ArticleUseCaseProtocol) {
        self.articlesManager = articlesManager
        self.sourceManager = sourceManager
        self.useCase = useCase
    }


    func getArticles() async {
        do throws(ArticleError) {
            articles = try await useCase.getArticles(for: sourceManager.userSelectedSources)
        } catch {
            self.error = error
            showErrorAlert = true
        }
    }

    func saveArticle(_ article: Article) {
        guard article.isSaved == true else { return }
        articlesManager.saveArticle(article)
    }

    func removeSavedArticle(_ article: Article) {
        guard article.isSaved == false else { return }
        articlesManager.removeSavedArticle(article)
    }
}
