//
//  APIArticle.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import Foundation

struct APIArticle: Decodable {
    let source: ArticleSource
    let author: String
    let title: String
    let description: String
    let url: URL
    let urlToImage: URL
    let publishedAt: String
    let content: String
}

