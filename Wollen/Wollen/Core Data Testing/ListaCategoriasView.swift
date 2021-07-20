//
//  ListaCategoriasView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 20/07/21.
//

import SwiftUI

struct ListaCategoriasView: View {
    
    @StateObject private var listaCategoriasVM = ListaCategoriasViewModel()
    @State private var isPresented: Bool = false
    
    var body: some View {
        
//        NavigationView {
//            List {
//                ForEach(listaCategoriasVM.categorias, id: \.id) { categoria in
//                    NavigationLink(
//                        destination: ListaDesejosCategoriaView(categoriaVM: categoria),
//                        label: {
//                            DetalhesCategoria(categoria: categoria)
//                        })
//                }
//            }
//            
//            
//            .navigationTitle("Categorias")
//            .listStyle(SidebarListStyle())
//            
//            ListaDesejosView()
//        }
        
        NavigationView{
            VStack {
                List{
                    ForEach(listaCategoriasVM.categorias, id: \.id) { categoria in
                        NavigationLink(
                            destination: ListaDesejosCategoriaView(categoriaVM: categoria),
                            label: {
                                DetalhesCategoria(categoria: categoria)
                            })
                    }
                }
                .listStyle(SidebarListStyle())
                
                NavigationLink(
                    destination: AddCategoriaView(),
                    label: {
                        Text("Add Categoria nl")
                    })
            }
            
            ListaDesejosView()
            
        }
        .navigationTitle("Categorias")
        .navigationBarItems(trailing: Button("Add Categoria botao") {
            isPresented = true
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            listaCategoriasVM.getAllCategorias()
        },  content: {
            AddCategoriaView()
        })
        .onAppear(perform: {
            listaCategoriasVM.getAllCategorias()
        })
    }
}

struct ListaCategoriasView_Previews: PreviewProvider {
    static var previews: some View {
        ListaCategoriasView()
    }
}

struct DetalhesCategoria: View {
    
    let categoria: CategoriaViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(categoria.nome)
            Text(categoria.cor)
        }
    }
}
