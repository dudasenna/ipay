//
//  AddDesejoView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 20/07/21.
//

import SwiftUI

struct AddDesejoToCategoriaView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var addDesejoVM = AddDesejoViewModel()
    let categoriaVM: CategoriaViewModel
    
    var body: some View {
        VStack {
            TextField("Nome", text: $addDesejoVM.nome)
            TextField("Preco", text: $addDesejoVM.preco)
            TextField("Descricao", text: $addDesejoVM.descricao)
            TextField("Link", text: $addDesejoVM.link)
            Button("Salvar") {
                addDesejoVM.addDesejoToCategoria(categoriaId: categoriaVM.id)
            }
        }.padding()
    }
}

struct AddDesejoView_Previews: PreviewProvider {
    static var previews: some View {
        let categoriaVM = CategoriaViewModel(categoria: Categoria(context: CoreDataManager.shared.viewContext))
        
        AddDesejoToCategoriaView(categoriaVM: categoriaVM)
    }
}
