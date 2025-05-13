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

    @Test func ArticleVMGetArticlesSetsArticlesSuccess() async throws {
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

}
