//
//  NewsAPIService.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//
import Foundation

class NewsAPIService {
    let sourcesUrlString = "https://newsapi.org/v2/top-headlines/sources?apiKey=\(getApiKey())"
    let apiKey = getApiKey()

    static func getApiKey() -> String {
        let url = Bundle.main.url(forResource: "APIKeys", withExtension: "plist")!
        let dict = NSDictionary(contentsOf: url)!
        let newsAPIKey = dict["NewsAPIKey"] as! String
        return newsAPIKey
    }

    func getSources() async throws(SourcesAPIError) -> [Source] {
        guard let url = URL(string: sourcesUrlString) else {
            throw .invalidSourcesURL
        }
        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "X-Api-Key")

        let (data, _): (Data, URLResponse)
        do {
            (data, _) = try await URLSession.shared.data(for: request)
        } catch {
            throw .noSources
        }

        do {
            let decoder = JSONDecoder()
            let sources = try decoder.decode([Source].self, from: data)
            return sources
        } catch {
            throw .decodingSourcesFailed
        }
    }

    }

