//
//   ArticlesVMTests.swift
//  NewsFlashTests
//
//  Created by Grace couch on 02/05/2025.
//

import Testing
@testable import NewsFlash
import Foundation

struct ArticlesVMTests {

    @Test func getArticlesSetsArticlesSuccess() async throws {
        let sut = ArticlesViewModel(articlesManager: ArticlesManager(), sourceManager: SourceManager(), useCase: TestSuccessArticleUseCase())
        #expect(sut.articles == [])

        await sut.getArticles()

        let testArticle = Article(
            source: ArticleSource(id: "1", name: "source"),
            author: "Grace 1",
            title: "Grace is learning iOS development 1",
            description: "Today we add tests to NewsFlash 1", url: URL(string: "fake url 1")!,
            urlToImage: URL(string: "fake image url 1")!,
            publishedAt: "1",
            content: "1st test",
            isSaved: false)

        #expect(sut.articles[0].author == testArticle.author)
    }

    @Test func getArticlesSetsArticlesFailure() async throws {
        let sut = ArticlesViewModel(articlesManager: ArticlesManager(), sourceManager: SourceManager(), useCase: TestFailureArticleUseCase())
        #expect(sut.articles == [])
        #expect(sut.error == nil)
        #expect(sut.showErrorAlert == false)

        await sut.getArticles()
        #expect(sut.articles == [])
        #expect(sut.error == ArticleError.api(.decodingFailed))
        #expect(sut.showErrorAlert == true)
    }


    @Test func saveArticleSuccess() async throws {
        let articlesManager = ArticlesManager()
        let sut = ArticlesViewModel(articlesManager: articlesManager, sourceManager: SourceManager(), useCase: TestSuccessArticleUseCase())
        #expect(articlesManager.savedArticles == [])

        let testArticle = Article(
            source: ArticleSource(id: "1", name: "source"),
            author: "Grace 1",
            title: "Grace is learning iOS development 1",
            description: "Today we add tests to NewsFlash 1", url: URL(string: "fake url 1")!,
            urlToImage: URL(string: "fake image url 1")!,
            publishedAt: "1",
            content: "1st test",
            isSaved: true)

        sut.saveArticle(testArticle)

        #expect(articlesManager.savedArticles.contains(testArticle))
    }

    @Test func removeSavedArticleSuccess() async throws {
        let articlesManager = ArticlesManager()
        let sut = ArticlesViewModel(articlesManager: articlesManager, sourceManager: SourceManager(), useCase: TestSuccessArticleUseCase())

        var testArticle = Article(
            source: ArticleSource(id: "1", name: "source"),
            author: "Grace 1",
            title: "Grace is learning iOS development 1",
            description: "Today we add tests to NewsFlash 1", url: URL(string: "fake url 1")!,
            urlToImage: URL(string: "fake image url 1")!,
            publishedAt: "1",
            content: "1st test",
            isSaved: true)

        sut.saveArticle(testArticle)

        #expect(articlesManager.savedArticles.contains(testArticle))

        testArticle.isSaved = false

        sut.removeSavedArticle(testArticle)

        #expect(articlesManager.savedArticles == [])
    }

    struct TestSuccessArticleUseCase: ArticleUseCaseProtocol {
        func getArticles(for sourceId: Set<String>) async throws(ArticleError) -> [Article] {
            let testArticles: [Article] = [
                Article(
                    source: ArticleSource(id: "1", name: "source"),
                    author: "Grace 1",
                    title: "Grace is learning iOS development 1",
                    description: "Today we add tests to NewsFlash 1", url: URL(string: "fake url 1")!,
                    urlToImage: URL(string: "fake image url 1")!,
                    publishedAt: "1",
                    content: "1st test",
                    isSaved: false)]
            return testArticles
        }
    }

    struct TestFailureArticleUseCase: ArticleUseCaseProtocol {
        func getArticles(for sourceId: Set<String>) async throws(ArticleError) -> [Article] {
            throw ArticleError.api(.decodingFailed)
        }
    }

}
