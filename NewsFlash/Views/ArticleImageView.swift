//
//  ArticleImageView.swift
//  NewsFlash
//
//  Created by Grace couch on 06/05/2025.
//

import SwiftUI

struct ArticleImageView: View {
    let article: Article
    var body: some View {
        AsyncImage(url: article.urlToImage) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 50, height: 50)
        .clipShape(.circle)
    }
}

#Preview {
    ArticleImageView(article: .defaultArticle)
}
