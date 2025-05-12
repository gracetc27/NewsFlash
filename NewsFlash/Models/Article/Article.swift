//
//  Article.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import Foundation

struct Article: Codable, Identifiable, Hashable {
    var id: String { url.absoluteString }
    let source: ArticleSource
    let author: String?
    let title: String
    let description: String
    let url: URL
    let urlToImage: URL
    let publishedAt: String
    let content: String
    var isSaved: Bool

    static var defaultArticle: Article {
        Article(
            source: .init(id: "1", name: "Default Source"),
            author: nil,
            title: "Default Title",
            description: "Default Description",
            url: URL(string: "https://www.google.com")!,
            urlToImage: URL(string: "https://via.placeholder.com/150")!,
            publishedAt: "2025",
            content: "lalala",
            isSaved: false
            )
    }
}
