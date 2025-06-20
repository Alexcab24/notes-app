//
//  NCreateNoteView.swift
//  Notes
//
//  Created by Alex on 11/6/25.
//
import SwiftUI

struct NCreateNoteView: View {
    @StateObject var viewModel = NCreateNoteViewModel()
    
    var onNoteCreated: ((NCard) -> Void)?
    
    private func onTap() {
        let card = viewModel.createNote()
        print("Esta es tu nueva card \(card)")
        onNoteCreated?(card)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Crear nueva nota")
                    .font(.largeTitle.bold())
                    .padding(.bottom, 10)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Título")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    TextField("Ej: Tarea pendiente", text: $viewModel.title)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Contenido")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    TextEditor(text: $viewModel.text)
                        .scrollContentBackground(.hidden)
                        .frame(height: 150)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
                
                VStack(spacing: 16) {
                    HStack {
                        Text("Tamaño de nota")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Spacer()
                        Picker("", selection: $viewModel.type) {
                            Text("Pequeña").tag(NCardType.small)
                            Text("Mediana").tag(NCardType.medium)
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 200)
                    }
                    
                    Toggle(isOn: $viewModel.isFavorite) {
                        Text("Marcar como favorita")
                    }
                }
                
                Button(action: onTap) {
                    Text("Guardar nota")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                }
                .padding(.top)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
            .padding()
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.cyan.opacity(0.15), Color.blue.opacity(0.05)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
        )
    }
}

#Preview {
    NCreateNoteView()
}
