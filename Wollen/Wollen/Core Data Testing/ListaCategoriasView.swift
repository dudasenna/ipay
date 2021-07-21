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
        
        NavigationView {
            VStack {
                
                List {
                    Group {
                        Text("Categorias")
                            .font(.title)
                            //.font(.custom("Avenir Next", size: 22))
                            .fontWeight(.bold)
                        
                        
                        NavigationLink(
                            destination: ListaDesejosView(),
                            label: {
                                Text("Geral")
                                    .font(.title2)
                            })
                        
                        ForEach(listaCategoriasVM.categorias, id: \.id) { categoria in
                            
                            NavigationLink(
                                destination: ListaDesejosCategoriaView(categoriaVM: categoria),
                                label: {
                                    DetalhesCategoria(categoria: categoria)
                                        //.font(.custom("Avenir Next", size: 18))
                                        .font(.title2)
                                })
                        }
                        
                        Button {
                            isPresented.toggle()
                        } label: {
                            Text("Nova categoria")
                                .font(.title2)
                        }
                        .sheet(isPresented: $isPresented, onDismiss: {
                            listaCategoriasVM.getAllCategorias()
                        }, content: {
                            AddCategoriaView()
                        })
                        
                    }
                }.listStyle(SidebarListStyle())
                
            }
            
            ListaDesejosView()
            
        }
        
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
                .font(.footnote)
        }
    }
}
