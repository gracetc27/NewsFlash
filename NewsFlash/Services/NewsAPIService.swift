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


    func getHeadlines(for sources: Set<String>) {
        let articlesUrlString = "https://newsapi.org/v2/everything?sources=\(sources.joined(separator:","))"
    }

    func getSources() async throws(SourcesAPIError) -> [Source] {
        guard let url = URL(string: sourcesUrlString) else {
            throw .invalidSourcesURL
        }
        var request = URLRequest(url: url)
        request.addValue(Self.apiKey, forHTTPHeaderField: "X-Api-Key")

        let (data, _): (Data, URLResponse)
        do {
            (data, _) = try await URLSession.shared.data(for: request)
        } catch {
            throw .noSources
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
            throw .decodingSourcesFailed
        }
    }
}

