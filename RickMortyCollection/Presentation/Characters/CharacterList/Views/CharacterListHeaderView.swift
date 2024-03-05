//
//  CharacterListHeader.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import SwiftUI

struct CharacterListHeaderView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .bold()
            Spacer()
        }
        .padding(20)
    }
}

#Preview {
    CharacterListHeaderView(title: "Characters")
}
