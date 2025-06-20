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
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                Text(card.title)
                    .font(.headline)
                    .lineLimit(2)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.cyan.opacity(0.2))
                    .cornerRadius(8)
                
                Text(card.text)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
            }

            Spacer()

            Image(systemName: card.isFavorite ? "heart.fill" : "heart")
                .foregroundStyle(card.isFavorite ? Color.red : Color.gray)
                .font(.title3)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .listRowSeparator(.hidden)
    }
    
    @ViewBuilder
    func MediumCardView() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Spacer()
                Image(systemName: card.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(card.isFavorite ? Color.red : Color.gray)
                    .font(.title3)
            }

            Text(card.title)
                .font(.title2.bold())
                .lineLimit(2)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.cyan.opacity(0.2))
                .cornerRadius(8)

            Text(card.text)
                .font(.body)
                .foregroundColor(.secondary)
                .lineLimit(3)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
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
    VStack(spacing: 20) {
        NCardView(card: NCard(title: "Tip Diario", text: "Recuerda tomar agua cada 2 horas para mantenerte hidratado.", isFavorite: false, type: .small))
        NCardView(card: NCard(title: "Nueva Funcionalidad", text: "Explora la nueva sección de productividad para organizar tus tareas más fácilmente.", isFavorite: true, type: .medium))
    }
    .padding()
    .background(Color(UIColor.systemGroupedBackground))
}
