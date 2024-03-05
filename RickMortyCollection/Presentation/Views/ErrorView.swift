//
//  ErrorView.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import SwiftUI

struct ErrorView: View {
    
    let error: String
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .renderingMode(.original)
                .symbolRenderingMode(.multicolor)
                .frame(width: 80, height: 80)
            
            VStack(alignment: .center, spacing: 10) {
                Text("Something went wrong")
                    .font(.title)
                    .fontWeight(.semibold)
                Text(error)
            }
            .padding()
        }
    }
}

#Preview {
    ErrorView(error: "We couldn't retrieve the data. Please check your internet connection.")
}
