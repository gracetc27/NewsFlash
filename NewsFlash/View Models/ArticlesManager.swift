//
//  ArticlesManager.swift
//  NewsFlash
//
//  Created by Grace couch on 08/05/2025.
//
import Foundation

@Observable
class ArticlesManager {
    var savedArticles: Set<Article> = []

    var sortedArticles: [Article] {
        Array(savedArticles).sorted { $0.publishedAt > $1.publishedAt }
    }

    private let savePath = URL.documentsDirectory.appendingPathComponent("articles")


    func loadSavedArticles() async {
        do {
            let data = try Data(contentsOf: savePath)
            savedArticles = try JSONDecoder().decode(Set<Article>.self, from: data)
        } catch {
            print(error.localizedDescription)
            savedArticles = []
        }
    }

    func saveArticle(_ article: Article) {
        do {
            savedArticles.insert(article)
            let data = try JSONEncoder().encode(savedArticles)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }

    func removeSavedArticle(_ article: Article) {
        do {
            guard let articleToRemove = savedArticles.first(where: {
                article.id == $0.id
            }) else { return }
            savedArticles.remove(articleToRemove)
            let data = try JSONEncoder().encode(savedArticles)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print(error)
        }
    }

}
