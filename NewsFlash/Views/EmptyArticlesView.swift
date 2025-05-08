//
//  EmptyArticlesView.swift
//  NewsFlash
//
//  Created by Grace couch on 08/05/2025.
//

import SwiftUI

struct EmptyArticlesView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Label("No News...", systemImage: "globe")
                .font(.largeTitle.bold())
            Text("Select some sources to see headlines")
        }
    }
}

#Preview {
    EmptyArticlesView()
}
