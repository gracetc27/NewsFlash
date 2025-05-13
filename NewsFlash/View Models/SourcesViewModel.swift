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
    let sourceUseCase: SourceUseCaseProtocol
    var sources: [Source] = []
    var error: SourceError?
    var showErrorAlert = false

    init(sourceManager: SourceManager, sourceUseCase: SourceUseCase) {
        self.sourceManager = sourceManager
        self.sourceUseCase = sourceUseCase
    }

    func getSources() async {
        do throws(SourceError) {
            sources = try await sourceUseCase.getSources()
        } catch {
            self.error = error
            showErrorAlert = true
        }
    }

    func addSelectedSource(_ source: Source) {
        guard source.isSelected == true else { return }
        sourceManager.saveSource(source)
    }

    func removeSelectedSource(_ source: Source) {
        guard source.isSelected == false else { return }
        sourceManager.removeSavedSource(source)
    }
}

