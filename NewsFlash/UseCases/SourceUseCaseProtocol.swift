//
//  SourceUseCaseProtocol.swift
//  NewsFlash
//
//  Created by Grace couch on 13/05/2025.
//
import Foundation

protocol SourceUseCaseProtocol {
    func getSources() async throws(SourceError) -> [Source]
}
