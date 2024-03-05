//
//  CharacterDetailImageView.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import SwiftUI

struct CharacterDetailImageView: View {
    
    let imageURL: URL?
    
    var body: some View {
        AsyncImage(url: imageURL) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    CharacterDetailImageView(imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        .padding()
}
