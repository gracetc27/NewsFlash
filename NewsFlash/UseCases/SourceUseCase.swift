//
//  SourceUseCase.swift
//  NewsFlash
//
//  Created by Grace couch on 08/05/2025.
//

import Foundation

class SourceUseCase: SourceUseCaseProtocol {
    let service = NewsAPIService()
    let sourceManager: SourceManager

    init(sourceManager: SourceManager) {
        self.sourceManager = sourceManager
    }

    func getSources() async throws(SourceError) -> [Source] {
        do throws(APIError) {
            return try await service.getSources().map { source in
                Source(id: source.id,
                       name: source.name,
                       description: source.description,
                       url: source.url,
                       category: source.category,
                       language: source.language,
                       country: source.country,
                       isSelected: sourceManager.userSelectedSources.contains(source.id))
            }
        } catch(let error) {
            throw SourceError.api(error)
        }
    }
}
