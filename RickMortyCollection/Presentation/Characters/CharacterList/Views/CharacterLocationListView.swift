//
//  CharacterLocationListView.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import SwiftUI

struct CharacterLocationListView: View {
    
    let locations: [Location]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(locations) { location in
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(location.name)
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text(location.dimension ?? "")
                            .font(.subheadline)
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(Color.white.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 8)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ScrollView {
        CharacterLocationListView(locations: Location.mock)
    }
}
