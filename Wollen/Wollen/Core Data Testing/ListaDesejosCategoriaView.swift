//
//  ListaDesejosCategoriaView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 20/07/21.
//

import SwiftUI

struct ListaDesejosCategoriaView: View {
    @State private var isPresented: Bool = false
    
    @StateObject private var listaDesejosVM = ListaDesejosViewModel()
    
    let categoriaVM: CategoriaViewModel
    
    var body: some View {
        VStack {
            List(listaDesejosVM.desejos, id: \.id) { desejo in
                VStack(alignment: .leading) {
                    Text(desejo.nome)
                    Text(String(desejo.preco))
                        .font(.caption)
                    Text(desejo.descricao)
                        .font(.caption)
                    Text(desejo.link)
                        .font(.caption)
                }
            }
        }
        .navigationTitle(categoriaVM.nome)
        .navigationBarItems(trailing: Button("Add novo desejo na categoria \(categoriaVM.nome)") {
             isPresented = true
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            listaDesejosVM.getDesejosOfCategoria(categoria: categoriaVM)
        }, content: {
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
