//
//  ContentView.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import SwiftUI

struct MainView: View {
    let sourceManager = SourceManager()
    var body: some View {
        TabView {
            ArticleHeadlineView()
                .tabItem {
                    Label("Headlines", systemImage: "list.dash")
                }

            SourceView()
                .tabItem {
                    Label("Sources", systemImage: "square.and.pencil")
                }

            SavedView()
                .tabItem {
                    Label("Saved", systemImage: "star.fill")
                }
        }
    }
}

#Preview {
    MainView()
}
