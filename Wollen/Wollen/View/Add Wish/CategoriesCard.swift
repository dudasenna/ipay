//
//  CategoriesCard.swift
//  Wollen
//
//  Created by Eduarda Senna on 27/07/21.
//

import SwiftUI

struct CategoriesCard: View {
    
    private var adaptiveLayout = [GridItem(.adaptive(minimum: 150))]
    private var flexibleLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var categoriesTitle = ["Tecnologia", "Roupa", "Viagem", "Comida", "Saúde", "Livros"]
    var categoriesColor: [String] = ["systemYellow700", "systemOrange700", "systemGreen700", "systemCyan700", "systemPurple700", "systemPink700"]
    var categoriesSelectedColor: [String] = ["systemYellow", "systemOrange", "systemGreen", "systemCyan", "systemPurple", "systemPink"]
    @State private var categorySelected: Int = 0
//    @State private var newCategory: String = ""
    
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
                HStack (spacing:20) {
//                    ForEach (0..<categoriesTitle.count) { category in
//                        CategoryCard(categoryColor: categoriesColor[category], categoryTitle: categoriesTitle[category])
//                    } .frame(width: 120, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    ForEach(0..<categoriesTitle.count) { category in
                        Button(
                            action: {
//                    CategoryCard(categoryColor: categoriesColor[category], categoryTitle: categoriesTitle[category])
                                
                                categorySelected = category
//                                addCategoriaVM.cor = colorName
                            },
                            label: {
                                
                            CategoryCard(categoryColor: categoriesColor[category], categoryTitle: categoriesTitle[category])
                                
                                    .foregroundColor(Color(UIColor(named: "preto_primario")!))
                                    .font(.custom("Avenir Next", size: 18))
                                            
                                
                                if category == categorySelected {
                                    
                                } else {
                                }
                            }
                        )
                    }
                }
                
                }
            
//
//            }
            
            .padding()
            
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
//                Text(LocalizedStringKey("Outra:"))
//                    .font(.custom("Avenir Next", size: 18))
//                TextField(LocalizedStringKey("Nova categoria"), text: $newCategory)
//                    .padding(5)
//                    .background(Color(red: 118/256, green: 118/256, blue: 128/256, opacity: 0.12))
//                    .cornerRadius(10)
//                    .multilineTextAlignment(.center)
//                    .font(.custom("Avenir Next", size: 16))
//                Button(
//                    action: {
////                        NavigationLink(
////                        destination:
////                              NewCategory())
//                    },
//                    label: {
//                        Text(LocalizedStringKey("Outra"))
//                            .foregroundColor(Color(UIColor(named: "preto_primario")!))
//                            .font(.custom("Avenir Next", size: 18))
//                            .padding(5)
//                    }
                NavigationLink(
                    destination:
                       NewCategory(),
                    label: {
                        Text(LocalizedStringKey("Outra"))
                                                    .foregroundColor(Color(UIColor(named: "preto_primario")!))
                                                    .font(.custom("Avenir Next", size: 18))
                                                    .padding(5)
                        
                    })
                .padding(5)
                .background(Color(UIColor(named: "systemMint")!))
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.4), radius: 5)
            }
            .padding(10)
            .padding(.horizontal)
        }
        .padding(15)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
        
        
    }

}


struct CategoriesCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesCard()
            .previewDevice("iPhone 11")
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
