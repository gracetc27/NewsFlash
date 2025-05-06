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
        VStack(alignment: .leading) {
            HStack {
                Text(article.title)
                    .font(.headline)
                Text("(\(article.author ?? "Unknown Author"))")
                    .italic()
            }

            HStack {
                ArticleImageView(article: article)
                Spacer()
                Text(article.description).lineLimit(5)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ArticleItemView(article: .defaultArticle)
}
