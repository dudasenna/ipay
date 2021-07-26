//
//  AddCategoriaView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 20/07/21.
//

import SwiftUI

struct AddCategoriaView: View {
    
    // Adiciona uma categoria a partir da Side Bar
    
    @StateObject private var addCategoriaVM = AddCategoriaViewModel()
    
    var body: some View {
        VStack {
            TextField("Nome categoria", text: $addCategoriaVM.nome)
            TextField("Cor", text: $addCategoriaVM.cor)
            Button("Salvar") {
                addCategoriaVM.saveCategoria()
            }
        }.padding()
    }
}

struct AddCategoriaView_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoriaView()
    }
}
