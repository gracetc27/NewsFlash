//
//  SourcesVMTests.swift
//  NewsFlashTests
//
//  Created by Grace couch on 13/05/2025.
//

import Testing
@testable import NewsFlash
import Foundation

struct SourcesVMTests {

    @Test func getSourcesSetsSourcesSuccess() async throws {
        let sut = SourcesViewModel(sourceManager: SourceManager(), sourceUseCase: TestSuccessSourceUseCase())
        #expect(sut.sources == [])

        await sut.getSources()
        let testSource = Source(
            id: "1",
            name: "Grace",
            description: "Graces sources",
            url: URL(string: "test url")!,
            category: "danger",
            language: "en",
            country: "en",
            isSelected: false)

        #expect(sut.sources[0].id == testSource.id)
    }

    @Test func getSourcesSetsSourcesFailure() async throws {
        let sut = SourcesViewModel(sourceManager: SourceManager(), sourceUseCase: TestFailureSourceUseCase())
        #expect(sut.sources == [])
        #expect(sut.showErrorAlert == false)
        #expect(sut.error == nil)


        await sut.getSources()

        #expect(sut.sources == [])
        #expect(sut.showErrorAlert == true)
        #expect(sut.error == SourceError.api(.invalidURL))
    }

    @Test func addSelectedSourceSuccess() async throws {
        let sourceManager = SourceManager()
        let sut = SourcesViewModel(sourceManager: sourceManager, sourceUseCase: TestSuccessSourceUseCase())

        #expect(sourceManager.userSelectedSources == [])

        let testSource = Source(
            id: "1",
            name: "Grace",
            description: "Graces sources",
            url: URL(string: "test url")!,
            category: "danger",
            language: "en",
            country: "en",
            isSelected: true)

        sut.addSelectedSource(testSource)

        #expect(sourceManager.userSelectedSources.contains(testSource.id))
    }

    @Test func removeSelectedSourceSuccess() async throws {
        let sourceManager = SourceManager()
        let sut = SourcesViewModel(sourceManager: sourceManager, sourceUseCase: TestSuccessSourceUseCase())

        var testSource = Source(
            id: "1",
            name: "Grace",
            description: "Graces sources",
            url: URL(string: "test url")!,
            category: "danger",
            language: "en",
            country: "en",
            isSelected: true)

        sut.addSelectedSource(testSource)

        #expect(sourceManager.userSelectedSources.contains(testSource.id))
        testSource.isSelected = false

        sut.removeSelectedSource(testSource)

        #expect(sourceManager.userSelectedSources == [])
    }


    struct TestSuccessSourceUseCase: SourceUseCaseProtocol {
        func getSources() async throws(SourceError) -> [Source]  {
            let testSources: [Source] = [
                Source(
                    id: "1",
                    name: "Grace",
                    description: "Graces sources",
                    url: URL(string: "test url")!,
                    category: "danger",
                    language: "en",
                    country: "en",
                    isSelected: false)
                ]
            return testSources
        }
    }

    struct TestFailureSourceUseCase: SourceUseCaseProtocol {
        func getSources() async throws(SourceError) -> [Source] {
            throw SourceError.api(.invalidURL)
        }
    }

}
