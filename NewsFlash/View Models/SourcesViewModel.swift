//
//  SourcesViewModel.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import SwiftUI


@Observable
class SourcesViewModel {
    let service: NewsAPIService
    var sources: [Source] = []

    init(service: NewsAPIService) {
        self.service = service
    }

    func getSources() async {
        do {
            sources = try await service.getSources()
        } catch {
            sources = []
        }
    }
}
