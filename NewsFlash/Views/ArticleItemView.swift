//
//  ArticleItemView.swift
//  NewsFlash
//
//  Created by Grace couch on 06/05/2025.
//

import SwiftUI

struct ArticleItemView: View {
    let article: Article
    var body: some View {
        HStack {
            AsyncImage(url: article.url) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.headline)
                HStack {
                    Text(article.description)
                    Spacer()
                    Text(article.author ?? "Unknown Author")
                        .italic()
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ArticleItemView(article: .defaultArticle)
}
