//
//  HomeView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 30/07/21.
//

import SwiftUI

struct HomeView: View {
    
    // Exibe o card a lista de desejos geral (todas as categorias)
    // Exibe cards do gráfico e notícias
    // Adiciona cor de fundo
    
    var body: some View {
        ZStack {
            (Color(UIColor(named: "branco_bg")!))
                .ignoresSafeArea(.all)
            VStack(spacing: 30) {
                MyWishesCards()
                
                HStack(spacing: 30) {
                    LinksCard()
                    DescriptionCard()
                }
                Spacer()
            }
            .padding()
        }.navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
