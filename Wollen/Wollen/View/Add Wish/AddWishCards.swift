//
//  AddWish.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 31/07/21.
//

import SwiftUI

struct AddWishCards: View {
    var body: some View {
        
        VStack (alignment: .center, spacing: 30) {
            
            HStack (alignment: .top){
                Text(LocalizedStringKey("Adicionar desejo"))
                .bold()
                .font(.custom("Avenir Next", size: 30))
                
                Spacer()
                
                NavigationLink(
                    destination:
                        HomeView(),
                    label: {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(Color(UIColor(named: "systemMint")!))
                            .imageScale(.large)
                        
                    })
            }
            
            HStack (alignment: .top, spacing: 30) {
                InformationsCard()
                CategoriesCard()
            }
            
            HStack (alignment: .top, spacing: 30) {
                ImageCard()
                GoalCard()
            }
            
            Button {
                //
            } label: {
                Text(LocalizedStringKey("Salvar"))
                    .foregroundColor(Color(UIColor(named: "preto_primario")!))
                    .font(.custom("Avenir Next", size: 18).bold())
                    .padding(5)
            }
            .padding(5)
            .background(Color(UIColor(named: "systemMint")!))
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.4), radius: 5)

        }
        .padding(30)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
        
        
    }
}

struct AddWishCards_Previews: PreviewProvider {
    static var previews: some View {
        AddWishCards()
    }
}
