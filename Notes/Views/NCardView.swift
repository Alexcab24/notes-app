//
//  NCardView.swift
//  Notes
//
//  Created by Alex on 9/6/25.
//

import SwiftUI

struct NCardView: View {
    
    let card: NCard
    
    
     @ViewBuilder
     func SmallCardView() -> some View {
         VStack{
             // MARK: Card pequeña
             VStack{
                 
             }
             HStack {
                 Text(card.title)
                     .font(.headline)
                     .lineLimit(2)
                     .frame(width: 120)
                     .padding(8)
                     .background(Color.cyan.opacity(0.2))
                     .cornerRadius(8)
                 Text(card.text)
                     .font(.subheadline)
                     .lineLimit(2)
                     .multilineTextAlignment(.leading)
                     .frame(maxWidth: .infinity)
                 Image(systemName: "heart")
                     .foregroundStyle(Color.red)
             }
             .padding()
             .background(Color.gray.opacity(0.1))
             .cornerRadius(16)
            
             
         } .listRowSeparator(.hidden)
     }
     @ViewBuilder
     func MediumCardView() -> some View {
         // MARK: Card mediana
         VStack {
             HStack(alignment: .top) {
                 Spacer()
                 Image(systemName: "heart")
                     .foregroundStyle(Color.red)
             }
             Text(card.title)
                 .font(.title2)
                 .lineLimit(2)
                 .padding(.vertical, 8)
                 .padding(.horizontal, 30)
                 .background(Color.cyan.opacity(0.2))
                 .cornerRadius(8)
             Text(card.text)
                 .font(.body)
                 .lineLimit(2)
                 .multilineTextAlignment(.leading)
                 .frame(maxWidth: .infinity)
         }
         .frame(height: 150)
         .padding()
         .background(Color.gray.opacity(0.1))
         .cornerRadius(16)
         .listRowSeparator(.hidden)
     }
    var body: some View {
        switch card.type {
        case .small:
            SmallCardView()
        case .medium:
            MediumCardView()
        }
    }
}

#Preview {
    NCardView(card: NCard(title: "Hello", text: "World", isFavorite: false, type: .medium))
}
