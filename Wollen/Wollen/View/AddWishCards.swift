//
//  AddWish.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 31/07/21.
//

import SwiftUI

struct AddWishCards: View {
    var body: some View {
        
        VStack (alignment: .leading, spacing: 30) {
            
            Text(LocalizedStringKey("Adicionar desejo"))
                .bold()
                .font(.custom("Avenir Next", size: 30))
            
            HStack (alignment: .top, spacing: 30) {
                InformationsCard()
                CategoriesCard()
            }
            
            HStack (alignment: .top, spacing: 30) {
                ImageCard()
                GoalCard()
            }
        }
        .padding(15)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
        
    }
}

struct AddWishCards_Previews: PreviewProvider {
    static var previews: some View {
        AddWishCards()
    }
}
