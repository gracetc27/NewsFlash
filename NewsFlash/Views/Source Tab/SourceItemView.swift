//
//  SourceItemView.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import SwiftUI

struct SourceItemView: View {
    @Binding var source: Source
    var body: some View {
        HStack {
            Text(source.name)
                .font(.headline)
            Spacer()
            SelectButton(isSelected: $source.isSelected)
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var source = Source.sourceExample
    SourceItemView(source: $source)
}
