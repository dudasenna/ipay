//
//  ListaDesejosCategoriaView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 20/07/21.
//

import SwiftUI

struct ListaDesejosCategoriaView: View {
    
    // Exibe os desejos de uma categoria específica
    
    // Usado para exibir o sheet (modal)
    @State private var isPresented: Bool = false
    
    // Usado para retornar os desejos de uma categoria
    @StateObject private var listaDesejosVM = ListaDesejosViewModel()
    
    // Usado para criar o desejo
    @StateObject private var addDesejoVM = AddDesejoViewModel()
    
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
    
    func createDesejo() -> DesejoViewModel {
        // Cria um desejo associado a uma categoria e retorna o id do desejo criado
        let desejoId = addDesejoVM.createDesejoInCategoria(categoriaId: categoriaVM.id)
        
        // Usando o id do desejo criado, cria um desejo view model
        let desejoVM = listaDesejosVM.getDesejoById(desejoId: desejoId!)
        return desejoVM!
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
            let desejoVM = self.createDesejo()
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            listaDesejosVM.getDesejosOfCategoria(categoria: categoriaVM)
        }, content: {
            
            // Permite adicionar um desejo associado a uma categoria
            AddDesejoToCategoriaView(categoriaVM:categoriaVM)
            //AtualizarDesejo(desejoVM: desejoVM)
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
