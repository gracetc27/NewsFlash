//
//  NewsAPIService.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//
import Foundation

class NewsAPIService {
    static let apiKey: String = {
        let url = Bundle.main.url(forResource: "APIKeys", withExtension: "plist")!
        let dict = NSDictionary(contentsOf: url)!
        let newsAPIKey = dict["NewsAPIKey"] as! String
        return newsAPIKey
    }()

    let sourcesUrlString = "https://newsapi.org/v2/top-headlines/sources"


    func getArticles(for sources: Set<String>) async throws(APIError) -> [Article] {
        guard !sources.isEmpty else { return [] }
        let articlesUrlString = "https://newsapi.org/v2/everything?sources=\(sources.joined(separator:","))"

        guard let url = URL(string: articlesUrlString) else { throw .invalidURL }
        var request = URLRequest(url: url)
        request.addValue(Self.apiKey, forHTTPHeaderField: "X-Api-Key")
        let (data, _): (Data, URLResponse)
        do {
            (data, _) = try await URLSession.shared.data(for: request)
        } catch {
            throw .noData
        }

        do {
            let decoder = JSONDecoder()
            let articlesPayload = try decoder.decode(ArticlesPayload.self, from: data)
            return articlesPayload.articles.map { article in
                Article(id: UUID(),
                        source: ArticleSource(id: article.source.id, name: article.source.name),
                        author: article.author,
                        title: article.title,
                        description: article.description,
                        url: article.url,
                        urlToImage: article.urlToImage,
                        publishedAt: article.publishedAt,
                        content: article.content,
                        isSaved: false)
            }
        } catch {
            print(error)
            throw.decodingFailed
        }
    }


    func getSources() async throws(APIError) -> [Source] {
        guard let url = URL(string: sourcesUrlString) else {
            throw .invalidURL
        }
        var request = URLRequest(url: url)
        request.addValue(Self.apiKey, forHTTPHeaderField: "X-Api-Key")

        let (data, _): (Data, URLResponse)
        do {
            (data, _) = try await URLSession.shared.data(for: request)
        } catch {
            throw .noData
        }

        do {
            let decoder = JSONDecoder()
            let sourcesPayload = try decoder.decode(SourcesPayload.self, from: data)
            return sourcesPayload.sources.map { source in
                Source(id: source.id,
                       name: source.name,
                       description: source.description,
                       url: source.url,
                       category: source.category,
                       language: source.language,
                       country: source.country,
                       isSelected: false)
            }
        } catch {
            print(error)
            throw .decodingFailed
        }
    }
}

