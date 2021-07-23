//
//  ListaDesejosCategoriaView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 20/07/21.
//

import SwiftUI

struct ListaDesejosCategoriaView: View {
    
    // Exibe os desejos de uma categoria específica
    
    @State private var isPresented: Bool = false
    
    @StateObject private var listaDesejosVM = ListaDesejosViewModel()
    
    let categoriaVM: CategoriaViewModel
    
    func deleteDesejo(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let desejo = listaDesejosVM.desejos[index]
            // Deletar desejo
            listaDesejosVM.deleteDesejo(desejoSelecionado: desejo)
            
            // Atualizar desejos da categoria
            listaDesejosVM.getDesejosOfCategoria(categoria: categoriaVM)
        }
    }
    
    var body: some View {        
        VStack {
            List(listaDesejosVM.desejos, id: \.id) { desejo in
                ForEach(listaDesejosVM.desejos, id: \.id) { desejo in
                    
                    NavigationLink(
                        destination: DesejoView(desejoVM: desejo),
                        label: {
                            DetalhesDesejo(desejo: desejo)
                        })
                    
                }.onDelete(perform: deleteDesejo)
            }
        }
        .navigationTitle(categoriaVM.nome)
        .navigationBarItems(trailing: Button("Novo desejo na categoria \(categoriaVM.nome)") {
             isPresented = true
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            listaDesejosVM.getDesejosOfCategoria(categoria: categoriaVM)
        }, content: {
            
            // Permite adicionar um desejo associado a uma categoria
            AddDesejoToCategoriaView(categoriaVM:categoriaVM)
        })
        .onAppear(perform: {
            listaDesejosVM.getDesejosOfCategoria(categoria: categoriaVM)
        })
    }
}

struct ListaDesejosCategoriaView_Previews: PreviewProvider {
    static var previews: some View {
        
        let categoriaVM = CategoriaViewModel(categoria: Categoria(context: CoreDataManager.shared.viewContext))
        ListaDesejosCategoriaView(categoriaVM: categoriaVM)
    }
}
