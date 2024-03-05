//
//  CharacterDetailEpisodeListView.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import SwiftUI

struct CharacterDetailEpisodeListView: View {
    
    let episodes: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(episodes, id: \.self) { episode in
                HStack {
                    Text(episode)
                        .font(.title3)
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.secondary.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
            }
        }
    }
}

#Preview {
    CharacterDetailEpisodeListView(episodes: ["Episode #1"])
}
