//
//  Source.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//
import Foundation

struct Source: Identifiable {
    let id: String
    let name: String
    let description: String
    let url: URL
    let category: String
    let language: String
    let country: String
    var isSelected: Bool

    static var sourceExample: Source {
        Source(id: "1", name: "Grace Couch", description: "This is my example source", url: URL(string: "my url string")!, category: "news", language: "en", country: "en", isSelected: true)
    }
}
