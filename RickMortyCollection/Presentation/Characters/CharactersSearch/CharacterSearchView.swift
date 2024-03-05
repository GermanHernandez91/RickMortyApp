//
//  CharacterSearchView.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import SwiftUI

struct CharacterSearchView: View {
    
    @State private var viewModel = CharacterSearchViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            }
            
            List {
                ForEach(viewModel.characters) { character in
                    NavigationLink(destination: CharacterDetailView(characterId: character.id)) {
                        HStack(spacing: 10) {
                            AsyncImage(url: character.imageURL) { image in
                                image
                                   .resizable()
                                   .frame(width: 100, height: 100)
                            } placeholder: {
                                ProgressView()
                            }
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(character.name)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                HStack(spacing: 3) {
                                    Text(character.status)
                                    Text("-")
                                    Text(character.species)
                                }
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            }
                            
                            Spacer()
                        }
                        .listRowSeparator(.hidden)
                        .frame(maxWidth: .infinity)
                        .background(Color.secondary.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .overlay {
                    if viewModel.characters.isEmpty {
                        ContentUnavailableView(
                            "No Results Found",
                            systemImage: "tray"
                        )
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Characters")
        .searchable(
            text: $viewModel.searchQuery,
            prompt: Text("Search character by name")
        )
        .onChange(of: viewModel.searchQuery, { oldValue, newValue in
            Task {
                await viewModel.loadCharacters()
            }
        })
        .task {
            await viewModel.loadCharacters()
        }
    }
}

#Preview {
    NavigationStack {
        CharacterSearchView()
    }
}
