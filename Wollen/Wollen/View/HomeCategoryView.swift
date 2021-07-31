//
//  HomeCategoryView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 30/07/21.
//

import SwiftUI

struct HomeCategoryView: View {
    
    // Exibe o card com a lista de desejos de uma categoria
    // Adiciona cor de fundo
    
    let categoriaVM: CategoriaViewModel
    
    var body: some View {
        ZStack {
            (Color(UIColor(named: "branco_bg")!))
                .ignoresSafeArea(.all)
            VStack(spacing: 30) {
                WishesFromCategory(categoriaVM: categoriaVM)
                Spacer()
            }
            .padding()
        }.navigationBarHidden(true)
    }
}

struct HomeCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        
        let categoriaVM = CategoriaViewModel(categoria: Categoria(context: CoreDataManager.shared.viewContext))
        
        HomeCategoryView(categoriaVM: categoriaVM)
    }
}
