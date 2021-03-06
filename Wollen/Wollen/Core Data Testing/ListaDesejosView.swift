//
//  ListaDesejosView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 19/07/21.
//

import SwiftUI

struct ListaDesejosView: View {
    
    // Exibe todos os desejos de todas as categorias
    // É o conteúdo da aba Geral na Side bar
    
    @State private var isPresented: Bool = false
    @StateObject private var listaDesejosVM = ListaDesejosViewModel()
    
    @StateObject private var listaCategoriasVM = ListaCategoriasViewModel()
    
    func deleteDesejo(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let desejo = listaDesejosVM.desejos[index]
            // Deletar desejo
            listaDesejosVM.deleteDesejo(desejoSelecionado: desejo)
            
            // Atualizar desejos
            listaDesejosVM.getAllDesejos()
        }
    }
    
    var body: some View {
        List{
            ForEach(listaDesejosVM.desejos, id: \.id) { desejo in
                
                NavigationLink(
                    destination: DesejoView(desejoVM: desejo),
                    label: {
                        DetalhesDesejo(desejo: desejo)
                    })
                
            }.onDelete(perform: deleteDesejo)
        }
        .navigationBarItems(trailing: Button("Novo desejo") {
             isPresented = true
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            // Atualiza os desejos
            listaDesejosVM.getAllDesejos()
            
            // Atualiza as categorias
            listaCategoriasVM.getAllCategorias()
        }, content: {
            
            // Permite adicionar um desejo criando as informações de Meta e Categoria
            AddDesejoCompleto()
        })
        .onAppear(perform: {
            listaDesejosVM.getAllDesejos()
        })
    }
}

struct ListaDesejosView_Previews: PreviewProvider {
    static var previews: some View {
        ListaDesejosView()
    }
}



