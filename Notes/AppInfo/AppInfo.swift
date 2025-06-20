//
//  AppInfo.swift
//  Notes
//
//  Created by Alex on 18/6/25.
//

import Foundation

class AppInfo: ObservableObject {
    @Published var cards: [NCard] = [
        NCard(title: "Bienvenido a la App", text: "Descubre todas las funciones disponibles para ti.", isFavorite: false, type: .medium),
        NCard(title: "Consejo Diario", text: "Recuerda tomar agua cada 2 horas.", isFavorite: true, type: .small),
        NCard(title: "Actualización Disponible", text: "Una nueva versión ya está disponible en la App Store.", isFavorite: false, type: .medium),
        NCard(title: "Tip de Productividad", text: "Comienza el día con una lista de tareas claras.", isFavorite: true, type: .small),
        NCard(title: "Explora", text: "Revisa la nueva sección de recursos útiles.", isFavorite: false, type: .medium)
    ]
    
    
    var favorites: [NCard] {
        cards.filter {$0.isFavorite}
    }
    
    func createNote(card: NCard) {
        cards.append(card)
    }
}
