//
//  NCreateNoteView.swift
//  Notes
//
//  Created by Alex on 11/6/25.
//

import SwiftUI

struct NCreateNoteView: View {
    @StateObject var viewModel: NCreateNoteViewModel = NCreateNoteViewModel()

    
    var onNoteCreated: ((NCard) -> Void)?
    
    func onTap() {
//        create note
        let card = viewModel.createNote()
        
        print("Esta es tu nueva card \(card)")
        onNoteCreated?(card)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Create new note")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 10)
                
                TextField("Title", text: $viewModel.title)
                    .font(.headline)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                
                TextEditor(text: $viewModel.text)
                    .scrollContentBackground(.hidden)
                    .font(.body)
                    .frame(height: 150)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
            
            HStack {
                Text("Size:")
                Spacer()
                Picker("Sizes:", selection: $viewModel.type ) {
                    Text("Small").tag(NCardType.small)
                    Text("Medium").tag(NCardType.medium)
                }
            }
            .padding()
            Toggle("Favorite mark", isOn: $viewModel.isFavorite)
            
            Button {
                onTap()
            } label: {
                Text("Save note")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.top, 20)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .padding()
        .background(Color.cyan.opacity(0.2))
    }
}


#Preview {
    NCreateNoteView()
}
