//
//  SourceItemView.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import SwiftUI

struct SourceItemView: View {
    let source: Source
    var body: some View {
        HStack {
            Text(source.name)
                .font(.headline)
            Spacer()
            SelectButton()
        }
        .padding()
    }
}

#Preview {
    SourceItemView(source: .sourceExample)
}
