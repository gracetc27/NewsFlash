//
//  ArticlesViewModel.swift
//  NewsFlash
//
//  Created by Grace couch on 06/05/2025.
//

import SwiftUI

@Observable
class ArticlesViewModel {
    let sourceManager: SourceManager
    let service: NewsAPIService
    var articles: [Article] = []
    var showErrorAlert = false
    var error: APIError?

    init(service: NewsAPIService, sourceManager: SourceManager) {
        self.service = service
        self.sourceManager = sourceManager
    }

    func getArticles() async {
        do {
            articles = try await service.getArticles(for: sourceManager.userSelectedSources)
        } catch {
            self.error = error
            showErrorAlert = true
        }
    }
}
