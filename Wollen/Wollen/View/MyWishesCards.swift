//
//  MyWishesCards.swift
//  Wollen
//
//  Created by Eduarda Senna on 13/07/21.
//

import SwiftUI

struct MyWishesCards: View {
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Meus desejos")
                .bold()
                .font(.custom("Avenir Next", size: 36))
            Text("Categoria")
                .font(.custom("Avenir Next", size: 22))
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    MyWishCard()
                    Spacer(minLength: 10)
                    MyWishCard()
                    Spacer(minLength: 10)
                    MyWishCard()
                }
            }
            .padding(.horizontal)
            .shadow(color: Color.gray.opacity(0.4), radius: 5)
            //gostei mais da sombra no tom natural
        }
        .padding(20)
        .padding(.leading, 10)
        .background(Color(red: 256/256, green: 256/256, blue: 256/256))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct MyWishesCards_Previews: PreviewProvider {
    static var previews: some View {
        MyWishesCards()
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
