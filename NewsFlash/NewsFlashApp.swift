//
//  NewsFlashApp.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import SwiftUI

@main
struct NewsFlashApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @State private var isLoading = true
    let sourceManager = SourceManager()
    let articlesManager = ArticlesManager()
    var body: some Scene {
        WindowGroup {
            if isLoading {
                SplashScreenView()
                    .task(id: scenePhase) {
                        if scenePhase == .active {
                            await sourceManager.loadSavedSources()
                            sleep(3)
                            isLoading = false
                        }
                    }
            } else {
                MainView(sourceManager: sourceManager, articlesManager: articlesManager)
            }
        }
    }
}
