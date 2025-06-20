//
//  NDetailsView.swift
//  Notes
//
//  Created by Alex on 18/6/25.
//
import SwiftUI

struct NDetailsView: View {
    @State var card: NCard

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                HStack {
                    Circle()
                        .fill(card.type == .small ? Color.blue : Color.purple)
                        .frame(width: 50, height: 50)
                        .overlay(Image(systemName: "star.fill")
                                    .foregroundColor(.white)
                                    .font(.title2))
                    Spacer()
                }

                Text(card.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                Text(card.text)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
            .padding(.horizontal)
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.cyan.opacity(0.2), Color.blue.opacity(0.1)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }
}

#Preview {
    NDetailsView(card: NCard(title: "¡Bienvenido a la App!", text: "Aquí podrás descubrir todas las funcionalidades que hemos preparado especialmente para ti. ¡Explora, aprende y disfruta!", type: .medium))
}
