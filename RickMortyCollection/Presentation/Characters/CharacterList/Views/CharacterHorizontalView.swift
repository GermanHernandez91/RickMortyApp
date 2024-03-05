//
//  CharacterHorizontalView.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import SwiftUI

struct CharacterHorizontalView: View {
    
    let characters: [Character]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(characters) { character in
                    NavigationLink(value: character) {
                        HStack(alignment: .center, spacing: 15) {
                            AsyncImage(url: character.imageURL) { image in
                                image
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CharacterHorizontalView(characters: Character.mock)
}
