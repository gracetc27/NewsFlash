//
//  SourcesAPIError.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import Foundation

enum SourcesAPIError: Error, Equatable {
    case invalidSourcesURL
    case noSources
    case decodingSourcesFailed
}
