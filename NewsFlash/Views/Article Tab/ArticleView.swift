//
//  ArticleView.swift
//  NewsFlash
//
//  Created by Grace couch on 08/05/2025.
//

import SwiftUI

struct ArticleView: View {
    @Binding var article: Article
    var body: some View {
        ArticleSafariView(url: article.url)
            .toolbar {
                SaveButton(isSaved: $article.isSaved)
            }
    }
}

#Preview {
    ArticleView(article: .constant(.defaultArticle))
}
