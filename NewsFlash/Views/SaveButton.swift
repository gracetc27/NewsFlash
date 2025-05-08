//
//  SaveButton.swift
//  NewsFlash
//
//  Created by Grace couch on 08/05/2025.
//

import SwiftUI

struct SaveButton: View {
    @Binding var isSaved: Bool
    var body: some View {
        Button {
            isSaved.toggle()
        } label: {
            Image(systemName: isSaved ? "star.fill" : "star")
        }
        .foregroundStyle(.yellow)
    }
}

#Preview {
    SaveButton(isSaved: .constant(true))
}
