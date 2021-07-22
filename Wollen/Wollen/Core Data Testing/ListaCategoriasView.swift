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
    
    func deleteCategoria(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let categoria = listaCategoriasVM.categorias[index]
            // Deletar categoria
            listaCategoriasVM.deleteCategoria(categoriaSelecionada: categoria)
            
            // Atualizar categorias
            listaCategoriasVM.getAllCategorias()
        }
        //deusers.remove(atOffsets: offsets)
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                List {
                    Group {
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
                        }.onDelete(perform: deleteCategoria)
                        
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
                }
                .toolbar {
                    EditButton()
                }
                .listStyle(SidebarListStyle())
                .navigationTitle("Categorias")
                //.font(.custom("Avenir Next", size: 22))
                .accentColor(Color(UIColor(named: "systemMint")!))
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
