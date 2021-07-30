//
//  WishesFromCategory.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 30/07/21.
//

import SwiftUI

struct WishesFromCategory: View {
    
    @StateObject private var listaDesejosVM = ListaDesejosViewModel()
    
    let categoriaVM: CategoriaViewModel
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                VStack (alignment: .leading){
                    Text(LocalizedStringKey("Meus desejos"))
                        .bold()
                        .font(.custom("Avenir Next", size: 30))
                    Text(categoriaVM.nome)
                        .font(.custom("Avenir Next", size: 22))
                }
                Spacer()
                
                NavigationLink(
                    destination:
                        // Adicionar um desejo a uma categoria
                        AddDesejoToCategoriaView(categoriaVM:categoriaVM),
                    label: {
                        Image(systemName: "plus.circle")
                            .foregroundColor(Color(UIColor(named: "systemMint")!))
                            .imageScale(.large)
                        
                    })

            }
            .padding()
            
            
            ScrollView(.horizontal) {
                HStack(spacing: 30) {
                    ForEach(listaDesejosVM.desejos, id: \.id) { desejo in
                        
                        
                        NavigationLink(
                            destination: DesejoView(desejoVM: desejo),
                            label: {
                                MyWishCard(desejoVM: desejo)
                            })
                        
                    }
                }
            }
            
            .padding(.horizontal)
            .shadow(color: Color.gray.opacity(0.2), radius: 5)
            //gostei mais da sombra no tom natural
        }
        .onAppear(perform: {
            
            // Recuperar os desejos de uma categoria
            listaDesejosVM.getDesejosOfCategoria(categoria: categoriaVM)
        })
        .padding(20)
        .padding(.leading, 10)
        .background(Color(red: 256/256, green: 256/256, blue: 256/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

struct WishesFromCategory_Previews: PreviewProvider {
    static var previews: some View {
        
        let categoriaVM = CategoriaViewModel(categoria: Categoria(context: CoreDataManager.shared.viewContext))
        
        WishesFromCategory(categoriaVM: categoriaVM)
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
