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
            
            Text(LocalizedStringKey("Informações"))
                .bold()
                .padding(5)
                .font(.custom("Avenir Next", size: 22))
            
            // NOME
            
            HStack() {
                Text(LocalizedStringKey("Nome:"))
                    .font(.custom("Avenir Next", size: 18))
                TextField(LocalizedStringKey("Nome do produto"), text: $addDesejoVM.nome)
                    .padding(5)
                    .foregroundColor(.gray)
                    .font(.custom("Avenir Next", size: 16))
                    .multilineTextAlignment(.leading)
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.gray), lineWidth: 1))

            }
            .padding(10)
            
            // PREÇO
            
            HStack() {
                Text(LocalizedStringKey("Preço:"))
                    .font(.custom("Avenir Next", size: 18))
                TextField(LocalizedStringKey("Preço do produto"), text: $addDesejoVM.preco)
                    .padding(5)
                    .foregroundColor(.gray)
                    .font(.custom("Avenir Next", size: 16))
                    .multilineTextAlignment(.leading)
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.gray), lineWidth: 1))
            }
            .padding(10)
            
            // DESCRIÇÃO
            
            HStack() {
                Text(LocalizedStringKey("Descrição:"))
                    .font(.custom("Avenir Next", size: 18))
                TextField(LocalizedStringKey("Descrição do produto"), text: $addDesejoVM.descricao)
                    .padding(5)
                    .foregroundColor(.gray)
                    .font(.custom("Avenir Next", size: 16))
                    .multilineTextAlignment(.leading)
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.gray), lineWidth: 1))
            }
            .padding(10)
            
            //LINK
            
            HStack() {
                Text(LocalizedStringKey("Link:"))
                    .font(.custom("Avenir Next", size: 18))
                TextField(LocalizedStringKey("Link do produto"), text: $addDesejoVM.link)
                    .padding(5)
                    .foregroundColor(.gray)
                    .font(.custom("Avenir Next", size: 16))
                    .multilineTextAlignment(.leading)
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.gray), lineWidth: 1))
            }
            .padding(10)
            
            Button(LocalizedStringKey("Salvar")) {
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
