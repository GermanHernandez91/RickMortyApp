//
//  RickMortyCollectionApp.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import SwiftUI
import SwiftData

@main
struct RickMortyCollectionApp: App {
    var body: some Scene {
        WindowGroup {
            CharacterListView()
        }
        .modelContainer(AppDatabase.shared.sharedModelContainer)
    }
}
