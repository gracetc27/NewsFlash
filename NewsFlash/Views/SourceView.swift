//
//  SourceView.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import SwiftUI

struct SourceView: View {
    @State private var sourcesVM = SourcesViewModel(service: NewsAPIService())
    var body: some View {
        List {
            ForEach(sourcesVM.sources) { source in
                SourceItemView(source: source)
            }
        }
        .alert(isPresented: $sourcesVM.showErrorAlert, error: sourcesVM.error, actions: {})
        .task {
            await sourcesVM.getSources()
        }
    }
}

#Preview {
    SourceView()
}
