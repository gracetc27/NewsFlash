//
//  SourceManager.swift
//  NewsFlash
//
//  Created by Grace couch on 02/05/2025.
//
import Foundation

class SourceManager {
    var userSelectedSources: Set<String> = []

    private let savePath = URL.documentsDirectory.appendingPathComponent("sources")


    func loadSavedSources() async {
        do {
            let data = try Data(contentsOf: savePath)
            userSelectedSources = try JSONDecoder().decode(Set<String>.self, from: data)
        } catch {
            print(error.localizedDescription)
            userSelectedSources = []
        }
    }

    func saveSource(_ source: Source) {
        do {
            userSelectedSources.insert(source.id)
            let data = try JSONEncoder().encode(userSelectedSources)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }

    func removeSavedSource(_ source: Source) {
        do {
            userSelectedSources.remove(source.id)
            let data = try JSONEncoder().encode(userSelectedSources)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print(error)
        }
    }
}
