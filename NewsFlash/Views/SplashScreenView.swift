//
//  SplashScreenView.swift
//  NewsFlash
//
//  Created by Grace couch on 13/05/2025.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .resizable()
                .frame(width: 100, height: 100)
            Text("News Flash")
                .font(.largeTitle.bold())
            Text("The news is in...")
            ProgressView()
        }
        .italic()
    }
}

#Preview {
    SplashScreenView()
}
