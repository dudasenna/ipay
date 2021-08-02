//
//  CategoriesCard.swift
//  Wollen
//
//  Created by Eduarda Senna on 27/07/21.
//

import SwiftUI

struct CategoriesCard: View {
    
    init(addDesejoVM: AddDesejoViewModel) {
        self.addDesejoVM = addDesejoVM
    }
    
    @ObservedObject var addDesejoVM: AddDesejoViewModel
    
    @StateObject private var listaCategoriasVM = ListaCategoriasViewModel()
    
    @State private var colorSelected: String = "systemYellow"
    
    private var adaptiveLayout = [GridItem(.adaptive(minimum: 150))]
    private var flexibleLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var categoriesTitle = ["Tecnologia", "Roupa", "Viagem", "Comida", "Saúde", "Livros"]
    var categoriesColor = ["systemYellow700", "systemOrange700", "systemGreen700", "systemCyan700", "systemPurple700", "systemPink700"]
    @State private var newCategory: String = ""
    
    var body: some View {
        // TÍTULO - CATEGORIA
        VStack(alignment: .leading) {
            
            Text("Categoria")
                .bold()
                .padding(5)
                .font(.custom("Avenir Next", size: 22))
            
//            LazyVGrid (columns: adaptiveLayout, alignment: .center, spacing: 15){
//                ForEach (0..<categoriesTitle.count) { category in
//                    CategoryCard(categoryColor: categoriesColor[category], categoryTitle: categoriesTitle[category])
//                }
//            }
//            .padding()
            
            ScrollView(.horizontal) {
                HStack (spacing: 20) {
                    ForEach (listaCategoriasVM.categorias, id: \.id) { categoria in
                        
                        Button {
                            addDesejoVM.cor = categoria.cor
                            addDesejoVM.nomeCategoria = categoria.nome
                            
                            colorSelected = categoria.nome
                            
                        } label: {
                            if (categoria.nome == colorSelected) {
                                CategoryCard(categoryColor: categoria.cor, categoryTitle: categoria.nome)
                                    .foregroundColor(Color(UIColor.black))
                            } else {
                                CategoryCard(categoryColor: categoria.cor+"700", categoryTitle: categoria.nome)
                                    .foregroundColor(Color(UIColor.black))
                            }
                            
                        }

                    }
                }.padding()
                
            }
            .padding()
            
            HStack() {
                Text(LocalizedStringKey("Outra:"))
                    .font(.custom("Avenir Next", size: 18))
                TextField(LocalizedStringKey("Nova categoria"), text: $newCategory)
                    .padding(5)
                    .background(Color(red: 118/256, green: 118/256, blue: 128/256, opacity: 0.12))
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                    .font(.custom("Avenir Next", size: 16))

            }
            .padding(10)
            .padding(.horizontal)
        }
        .padding(15)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
        .onAppear(perform: {
            listaCategoriasVM.getAllCategorias()
        })
        
        
    }

}

struct CategoriesCard_Previews: PreviewProvider {
    static var previews: some View {
        
        let addDesejoVM = AddDesejoViewModel()
        
        CategoriesCard(addDesejoVM: addDesejoVM)
            .previewDevice("iPhone 11")
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
