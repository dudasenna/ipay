//
//  InformationsCard.swift
//  Wollen
//
//  Created by Eduarda Senna on 12/07/21.
//

import SwiftUI

struct InformationsCard: View {
    @State var productName: String = ""
    @State var productPrice: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Informações")
                .bold()
                .padding(5)
                .font(.custom("Avenir", size: 22))
            
            // NOME
            
            HStack() {
                Text("Nome:")
                    .font(.custom("Avenir", size: 18))
                TextField("Nome do produto", text: $productName)
                    .padding(5)
                    .background(Color(red: 118/256, green: 118/256, blue: 128/256, opacity: 0.12))
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                    .font(.custom("Avenir", size: 16))

            }
            .padding(10)
            
            // PREÇO
            
            HStack() {
                Text("Preço:")
                    .font(.custom("Avenir", size: 18))
                TextField("Nome do produto", text: $productName)
                    .padding(5)
                    .background(Color(red: 118/256, green: 118/256, blue: 128/256, opacity: 0.12))
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                    .font(.custom("Avenir", size: 16))
            }
            .padding(10)
            
            // DESCRIÇÃO
            
            HStack() {
                Text("Descrição:")
                    .font(.custom("Avenir", size: 18))
                TextField("Nome do produto", text: $productName)
                    .padding(5)
                    .background(Color(red: 118/256, green: 118/256, blue: 128/256, opacity: 0.12))
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                    .font(.custom("Avenir", size: 16))
            }
            .padding(10)
            
            //LINK
            
            HStack() {
                Text("Link:")
                    .font(.custom("Avenir", size: 18))
                TextField("Nome do produto", text: $productName)
                    .padding(5)
                    .background(Color(red: 118/256, green: 118/256, blue: 128/256, opacity: 0.12))
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                    .font(.custom("Avenir", size: 16))
            }
            .padding(10)
        }
        .padding(15)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
    }
}

struct InformationsCard_Previews: PreviewProvider {
    static var previews: some View {
        InformationsCard()
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
