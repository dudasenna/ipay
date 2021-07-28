//
//  InformationsCard.swift
//  Wollen
//
//  Created by Eduarda Senna on 12/07/21.
//

import SwiftUI

struct InformationsCard: View {
    
    @StateObject private var addDesejoVM = AddDesejoViewModel()
    @State var productName: String = ""
    @State var productPrice: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Informações")
                .bold()
                .padding(5)
                .font(.custom("Avenir Next", size: 22))
            // NOME
            
            HStack() {
                Text("Nome:")
                    .font(.custom("Avenir Next", size: 18))
                TextField("Nome do produto", text: $addDesejoVM.nome)
                    .padding(5)
                    .background(Color(red: 118/256, green: 118/256, blue: 128/256, opacity: 0.12))
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                    .font(.custom("Avenir Next", size: 16))

            }
            .padding(10)
            
            // PREÇO
            
            HStack() {
                Text("Preço:")
                    .font(.custom("Avenir Next", size: 18))
                TextField("Preço do produto", text: $addDesejoVM.preco)
                    .padding(5)
                    .background(Color(red: 118/256, green: 118/256, blue: 128/256, opacity: 0.12))
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                    .font(.custom("Avenir Next", size: 16))
            }
            .padding(10)
            
            // DESCRIÇÃO
            
            HStack() {
                Text("Descrição:")
                    .font(.custom("Avenir Next", size: 18))
                TextField("Descrição do produto", text: $addDesejoVM.descricao)
                    .padding(5)
                    .background(Color(red: 118/256, green: 118/256, blue: 128/256, opacity: 0.12))
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                    .font(.custom("Avenir Next", size: 16))
            }
            .padding(10)
            
            //LINK
            
            HStack() {
                Text("Link:")
                    .font(.custom("Avenir Next", size: 18))
                TextField("Link do produto", text: $addDesejoVM.link)
                    .padding(5)
                    .background(Color(red: 118/256, green: 118/256, blue: 128/256, opacity: 0.12))
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                    .font(.custom("Avenir Next", size: 16))
            }
            .padding(10)
            
            Button("Salvar") {
                addDesejoVM.saveDesejo()
                //print("Botao de salvar desejo")
            }
        }
        .padding(15)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
    }
}

struct InformationsCard_Previews: PreviewProvider {
    static var previews: some View {
        InformationsCard()
            .previewDevice("iPhone 11")
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
