//
//  ArticlesPayload.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//
import Foundation

struct ArticlesPayload: Decodable {
    let status: String
    let totalResults: Int
    let articles: [APIArticle]
}
