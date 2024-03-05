//
//  CharacterDetailView.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import SwiftUI

struct CharacterDetailView: View {
    
    @State var characterId: Int
    @State private var viewModel = CharacterDetailViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if viewModel.isLoading {
                ProgressView()
            } else {
                if let character = viewModel.character {
                   CharacterDetailHeaderView(
                        status: character.status,
                        species: character.species)
                    
                    VStack {
                        CharacterDetailImageView(imageURL: character.imageURL)
                    }
                    .padding(.bottom)
                    
                    CharacterDetailInfoView(
                        gender: character.gender.rawValue,
                        location: character.location?.name,
                        origin: character.origin?.name)
                    
                    CollapsibleView {
                        Text("Episodes")
                            .font(.title2)
                            .fontWeight(.semibold)
                    } content: {
                        CharacterDetailEpisodeListView(episodes: viewModel.episodes)
                    }
                    .padding(.horizontal, 5)
                    .padding(.top)
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle(viewModel.character?.name ?? "")
        .task {
            await viewModel.loadCharacter(id: characterId)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                }
            }
        }
        .alert("Something went wrong", isPresented: $viewModel.hasError) {
            Button("OK", role: .cancel) {}
        }
    }
}

#Preview {
    NavigationStack {
        CharacterDetailView(characterId: 1)
    }
}
