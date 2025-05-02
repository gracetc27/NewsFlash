//
//  NewsAPIService.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//
import Foundation

class NewsAPIService {
    let sourcesUrlString = "https://newsapi.org/v2/top-headlines/sources?apiKey=\(getApiKey())"

    static func getApiKey() -> String {
        let url = Bundle.main.url(forResource: "APIKeys", withExtension: "plist")!
        let dict = NSDictionary(contentsOf: url)!
        let newsAPIKey = dict["NewsAPIKey"] as! String
        return newsAPIKey
    }
}
