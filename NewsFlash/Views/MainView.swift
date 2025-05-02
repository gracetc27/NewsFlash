//
//  ContentView.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HeadlineView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }

            SourceView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }

            SavedView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

#Preview {
    MainView()
}
