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
            HStack {
                
                VStack {
                    Text("Desejo")
                        .bold()
                    TextField(LocalizedStringKey("Nome"), text: $addDesejoVM.nome)
                    TextField("Preco", text: $addDesejoVM.preco)
                    TextField("Descricao", text: $addDesejoVM.descricao)
                    TextField("Link", text: $addDesejoVM.link)
                }
                
                // Recupera informações da categoria
                VStack(spacing: 5) {
                    Text("Categoria")
                        .bold()
                    Text("Nome categoria: " + categoriaVM.nome)
                    Text("Cor categoria: " + categoriaVM.cor)
                }
                
                VStack {
                    Text("Meta")
                        .bold()
                    TextField("Valor Meta", text: $addDesejoVM.valorMeta)
                    TextField("Valor Atual", text: $addDesejoVM.valorAtual)
                    TextField("Duração", text: $addDesejoVM.duracao)
                    TextField("Frequência", text: $addDesejoVM.frequencia)
                }
            }
            
            Button(LocalizedStringKey("Salvar")) {
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
