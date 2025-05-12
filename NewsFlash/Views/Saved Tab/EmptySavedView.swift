//
//  EmptySavedView.swift
//  NewsFlash
//
//  Created by Grace couch on 12/05/2025.
//

import SwiftUI

struct EmptySavedView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Label("Nothing Saved...", systemImage: "globe")
                .font(.largeTitle.bold())
            Text("Save some articles to see them here!")
        }
    }
}

#Preview {
    EmptySavedView()
}
