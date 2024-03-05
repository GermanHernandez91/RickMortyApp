//
//  CharacterList.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import SwiftUI

struct CharacterListView: View {
    
    @State private var viewModel = CharacterListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            HStack(alignment: .center) {
                                CharacterListHeaderView(title: "Characters")
                                Spacer()
                                NavigationLink(destination: CharacterSearchView()) {
                                    Text("View all")
                                }
                            }
                            .padding(.trailing)
                            CharacterHorizontalView(characters: viewModel.characters)
                                .padding(.top, 5)
                        }
                        
                        VStack {
                            CharacterListHeaderView(title: "Locations")
                            CharacterLocationListView(locations: viewModel.locations)
                                .padding(.top, 5)
                        }
                    }
                }
            }
            .navigationTitle("RickMortyCollection")
            .navigationDestination(for: Character.self, destination: { character in
                CharacterDetailView(characterId: character.id)
            })
            .task {
                await viewModel.loadCharacters()
            }
            .alert("Something went wrong", isPresented: $viewModel.hasError) {
                Button("OK", role: .cancel) {}
            }
        }
    }
}

#Preview {
    CharacterListView()
}
