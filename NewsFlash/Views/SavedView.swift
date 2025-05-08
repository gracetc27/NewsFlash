//
//  SavedView.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import SwiftUI

struct SavedView: View {
    let articlesManager = ArticlesManager()
    var body: some View {
        List(articlesManager.savedArticles) { article in
            NavigationLink {
                ArticleSafariView(url: article.url)
            } label: {
                ArticleItemView(article: article)
            }
        }
        .task {
           await articlesManager.loadSavedArticles()
        }
    }
}

#Preview {
    SavedView()
}
