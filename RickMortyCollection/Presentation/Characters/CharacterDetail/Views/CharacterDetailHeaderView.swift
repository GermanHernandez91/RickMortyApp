//
//  CharacterDetailHeaderView.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import SwiftUI

struct CharacterDetailHeaderView: View {
    
    let status: String
    let species: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Text(status)
            Text("-")
            Text(species)
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    CharacterDetailHeaderView(status: "Alive", species: "Human")
}
