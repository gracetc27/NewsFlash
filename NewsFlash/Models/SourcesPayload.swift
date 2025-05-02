//
//  SourcesPayload.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import Foundation

struct SourcesPayload: Codable {
    let status: String
    let sources: [Source]
}
