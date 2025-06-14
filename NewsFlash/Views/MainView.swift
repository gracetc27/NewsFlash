//
//  ContentView.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import SwiftUI

struct MainView: View {
    let sourceManager: SourceManager
    let articlesManager: ArticlesManager
    var body: some View {
        TabView {
            ArticleHeadlineView(sourceManager: sourceManager, articlesManager: articlesManager)
                .tabItem {
                    Label("Headlines", systemImage: "list.dash")
                }

            SourceView(sourceManager: sourceManager)
                .tabItem {
                    Label("Sources", systemImage: "square.and.pencil")
                }

            SavedView(articlesManager: articlesManager)
                .tabItem {
                    Label("Saved", systemImage: "star.fill")
                }
        }
    }
}


#Preview {
    MainView(sourceManager: SourceManager(), articlesManager: ArticlesManager())
}
