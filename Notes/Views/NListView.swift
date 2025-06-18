//
//  NListView.swift
//  Notes
//
//  Created by Alex on 9/6/25.
//

import SwiftUI

struct NListView: View {
    @State var showSheet: Bool = false
    
    let cards: [NCard] = [
        NCard(title: "Card 1", text: "Texto del card 1", isFavorite: false, type: .small),
        NCard(title: "Card 2", text: "Texto del card 2", isFavorite: false, type: .medium),
        NCard(title: "Card 3", text: "Texto del card 3", isFavorite: false, type: .small),
        NCard(title: "Card 4", text: "Texto del card 4", isFavorite: false, type: .small),
    ]
   
    
    var body: some View {
        
        List{
            ForEach (cards) { card in
                NCardView(card: card)
                
            }
        }.listStyle(.plain)
            .sheet(isPresented: $showSheet) {
                NCreateNoteView() { card in
                    print(card)
                    showSheet = false
                }
            }
            .overlay {
                VStack {
                    Spacer()
                    Button("Create note") {
                        showSheet = true
                    }
                }
            }
    }
}

#Preview {
    NListView()
}
