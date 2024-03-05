//
//  CharacterDetailInfoView.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import SwiftUI

struct CharacterDetailInfoView: View {
    
    let gender: String
    let location: String?
    let origin: String?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Text("Additional Information")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    Text("Genre: \(gender)")
                    Text("Location: \(location ?? "Unknown")")
                    Text("Origin: \(origin ?? "Unknown")")
                }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.secondary.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CharacterDetailInfoView(gender: GenderType.Male.rawValue, location: "Earth", origin: "Earth")
        .padding()
}
