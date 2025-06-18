//
//  NCard.swift
//  Notes
//
//  Created by Alex on 9/6/25.
//


import Foundation

struct NCard: Identifiable {
    let id = UUID()
    let title: String
    let text: String
    var isFavorite: Bool = false
    let type: NCardType
    
}

enum NCardType {
    case small
    case medium
}
