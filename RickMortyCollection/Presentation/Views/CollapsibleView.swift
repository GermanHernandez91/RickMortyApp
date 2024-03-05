//
//  CollapsibleView.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import SwiftUI

struct CollapsibleView<Content: View>: View {
    
    let label: () -> Text
    let content: () -> Content
    
    @State private var collapsed = true
    
    var body: some View {
        VStack {
            Button {
                collapsed.toggle()
            } label: {
                HStack {
                    label()
                    Spacer()
                    Image(systemName: collapsed ? "chevron.down" : "chevron.up")
                }
                .padding(.bottom, 1)
                .background(Color.white.opacity(0.01))
            }
            .buttonStyle(PlainButtonStyle())
            
            VStack {
                content()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            .animation(.easeOut)
            .transition(.slide)
        }
    }
}

#Preview {
    CollapsibleView {
        Text("Header title")
    } content: {
        Text("Content")
    }
    .padding()
}
