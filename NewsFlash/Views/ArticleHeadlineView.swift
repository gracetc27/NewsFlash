//
//  HeadlineView.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import SwiftUI

struct ArticleHeadlineView: View {
    @State private var articlesVM: ArticlesViewModel

    init(sourceManager: SourceManager) {
        articlesVM = ArticlesViewModel(service: NewsAPIService(), sourceManager: sourceManager)
    }
    var body: some View {
        List(articlesVM.articles) { article in
            Text(article.title)
        }
        .alert(isPresented: $articlesVM.showErrorAlert, error: articlesVM.error, actions: {})
        .task {
            await articlesVM.getArticles()
        }
    }
}

#Preview {
    ArticleHeadlineView(sourceManager: SourceManager())
}
