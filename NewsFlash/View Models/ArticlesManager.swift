//
//  ArticlesManager.swift
//  NewsFlash
//
//  Created by Grace couch on 08/05/2025.
//
import Foundation

class ArticlesManager {
    var savedArticles: [Article] = []

    private let savePath = URL.documentsDirectory.appendingPathComponent("articles")


    func loadSavedArticles() async {
        do {
            let data = try Data(contentsOf: savePath)
            savedArticles = try JSONDecoder().decode([Article].self, from: data)
        } catch {
            print(error.localizedDescription)
            savedArticles = []
        }
    }

    func saveArticle(_ article: Article) {
        do {
            savedArticles.append(article)
            let data = try JSONEncoder().encode(savedArticles)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }

    func removeSavedArticle(_ article: Article) {
        do {
            savedArticles.removeAll { $0.id == article.id }
            let data = try JSONEncoder().encode(savedArticles)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print(error)
        }
    }

}
