//
//  Source.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//
import Foundation

struct Source: Codable {
    let id: String
    let name: String
    let description: String
    let url: URL
    let category: String
    let language: String
    let country: String
}
