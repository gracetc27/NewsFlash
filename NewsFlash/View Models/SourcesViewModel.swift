//
//  SourcesViewModel.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import SwiftUI


@Observable
class SourcesViewModel {
    private let sourceManager: SourceManager
    let service: NewsAPIService
    var sources: [Source] = []
    var error: SourcesAPIError?
    var showErrorAlert = false

    init(sourceManager: SourceManager, service: NewsAPIService) {
        self.sourceManager = sourceManager
        self.service = service
    }

    func getSources() async {
        do throws(SourcesAPIError) {
            sources = try await service.getSources()
        } catch {
            self.error = error
            showErrorAlert = true
        }
    }

    func addSelectedSource(_ source: Source) {
        guard source.isSelected == true else { return }
        sourceManager.userSelectedSources.insert(source.id)
        }

    func removeSelectedSource(_ source: Source) {
        guard source.isSelected == false else { return }
        sourceManager.userSelectedSources.remove(source.id)
    }
}

