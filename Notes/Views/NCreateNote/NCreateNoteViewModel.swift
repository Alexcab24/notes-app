//
//  NCreateNoteViewModel.swift
//  Notes
//
//  Created by Alex on 18/6/25.
//

import Foundation


class NCreateNoteViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var text: String = ""
    @Published var type: NCardType = .small
    @Published var isFavorite: Bool = false
    
    func createNote() -> NCard {
        
        let card = NCard(title: title, text: text, isFavorite: isFavorite, type: type)

        return card
    }
}
