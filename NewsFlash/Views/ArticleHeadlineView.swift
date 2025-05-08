//
//  HeadlineView.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import SwiftUI

struct ArticleHeadlineView: View {
    @State private var articlesVM: ArticlesViewModel

    init(sourceManager: SourceManager, articlesManager: ArticlesManager) {
        articlesVM = ArticlesViewModel(articlesManager: articlesManager, sourceManager: sourceManager, service: NewsAPIService())
    }
    var body: some View {
        NavigationStack {
            Group {
                if articlesVM.articles.isEmpty {
                    EmptyArticlesView()
                } else {
                    List(articlesVM.articles) { article in
                        NavigationLink {
                            ArticleSafariView(url: article.url)
                        } label: {
                            ArticleItemView(article: article)
                                .onChange(of: article.isSaved) { oldValue, newValue in
                                    // TODO: move to view model to test logic
                                    if newValue {
                                        articlesVM.saveArticle(article)
                                    } else {
                                        articlesVM.removeSavedArticle(article)
                                    }
                                }
                        }
                    }
                }
            }
            .alert(isPresented: $articlesVM.showErrorAlert, error: articlesVM.error, actions: {})
            .task {
                await articlesVM.getArticles()
            }
        }
    }
}



#Preview {
    ArticleHeadlineView(sourceManager: SourceManager(), articlesManager: ArticlesManager())
}
