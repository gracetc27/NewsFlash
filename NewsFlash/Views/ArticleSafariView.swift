//
//  ArticleSafariView.swift
//  NewsFlash
//
//  Created by Grace couch on 08/05/2025.
//

import SwiftUI
import SafariServices


struct ArticleSafariView: UIViewControllerRepresentable {
    let url: URL
    func makeUIViewController(context: UIViewControllerRepresentableContext<ArticleSafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<ArticleSafariView>) { }
}
#Preview {
    ArticleSafariView(url: URL(string: "ahhaha")!)
}
