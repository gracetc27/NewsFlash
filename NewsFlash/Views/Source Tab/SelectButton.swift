//
//  SelectButton.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//

import SwiftUI

struct SelectButton: View {
    @Binding var isSelected: Bool
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
        }
    }
}

#Preview {
    SelectButton(isSelected: .constant(true))
}
