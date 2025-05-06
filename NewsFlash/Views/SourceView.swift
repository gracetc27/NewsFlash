//
//  SourceView.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import SwiftUI

struct SourceView: View {
    @State private var sourcesVM: SourcesViewModel
    
    init(sourceManager: SourceManager) {
        self._sourcesVM = State(initialValue: SourcesViewModel(sourceManager: sourceManager, service: NewsAPIService()))
    }
    var body: some View {
        List($sourcesVM.sources) { $source in
            SourceItemView(source: $source)
                .onChange(of: source.isSelected) { oldValue, newValue in
                    // TODO: move to view model to test logic
                    if newValue {
                        sourcesVM.addSelectedSource(source)
                    } else {
                        sourcesVM.removeSelectedSource(source)
                    }
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
