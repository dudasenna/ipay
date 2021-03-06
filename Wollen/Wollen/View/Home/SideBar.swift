//
//  SideBar.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 30/07/21.
//

import SwiftUI

struct SideBar: View {
    
    // Exibe todas as categorias na Side Bar
    
    @StateObject private var listaCategoriasVM = ListaCategoriasViewModel()
    @State private var isPresented: Bool = false
    
    // Permite deletar uma categoria da lista de categorias
    func deleteCategoria(at indexSet: IndexSet) {
        indexSet.forEach { index in
            
            let categoria = listaCategoriasVM.categorias[index]
            
            // Deletar categoria
            listaCategoriasVM.deleteCategoria(categoriaSelecionada: categoria)
            
            // Atualizar categorias
            listaCategoriasVM.getAllCategorias()
        }
    }
    
    var body: some View {
        
        // MARK: Side Bar
        NavigationView {
            VStack {
                
                List {
                    Group {
                        
                        // Aba Geral - exibe todos os desejos, independente da categoria
                        
                        NavigationLink(
                            destination:
                                //ListaDesejosView(),
                                HomeView(),
                            label: {
                                Text("Geral")
                                    .font(.custom("Avenir Next", size: 22))
                            })
                        
                        // Lista de categorias - exibe todas as categorias cadastradas
                        
                        ForEach(listaCategoriasVM.categorias, id: \.id) { categoria in
                            
                            NavigationLink(
                                destination:
                                    HomeCategoryView(categoriaVM: categoria),
                                label: {
                                    Text(categoria.nome)
                                        .font(.custom("Avenir Next", size: 22))
                                })
                        }.onDelete(perform: deleteCategoria)
                        
                        // Botão para adicionar nova categoria
                        
                        Button {
                            isPresented.toggle()
                        } label: {
                            Text(LocalizedStringKey("Nova categoria"))
                                .font(.custom("Avenir Next", size: 22))
                        }
                        .sheet(isPresented: $isPresented, onDismiss: {
                            listaCategoriasVM.getAllCategorias()
                        }, content: {
                            NewCategory()
                        })
                        
                    }
                }
                
                // Personalização Side Bar
                // Muda a cor de fundo da Side Bar
                .onAppear {
                    UITableView.appearance().backgroundColor = .white
                }
                // Muda a cor de fundo de um item selecionado na Lista
                .accentColor(Color("systemMint"))
               
                .toolbar {
                    EditButton()
                        //.font(.custom("Avenir Next", size: 18))
                }
                
                .navigationTitle(LocalizedStringKey("Categorias"))

            }
           
            // Exibe card com os desejos de todas as categorias
            // Exibe cards do gráfico e noticias
            HomeView()
            
        }
        // Modifica a fonte do título da Navigation bar e a cor dos ícones
        .navigationAppearance(backgroundColor: .white, foregroundColor: .black, tintColor: UIColor(Color("systemMint")), hideSeparator: true)
        .onAppear(perform: {
            listaCategoriasVM.getAllCategorias()
        })
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
