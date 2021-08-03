//
//  InformationsCard.swift
//  Wollen
//
//  Created by Eduarda Senna on 12/07/21.
//

import SwiftUI
import Combine

struct InformationsCard: View {
    
    init(addDesejoVM: AddDesejoViewModel) {
        self.addDesejoVM = addDesejoVM
    }
    
    @ObservedObject var addDesejoVM: AddDesejoViewModel
    @State private var productName: String = ""
    @State private var productPrice: String = ""
    @State private var productPriceFiltered: String = ""
    @State private var productDescription: String = ""
    @State private var productLink: String = ""
    
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
                TextField(LocalizedStringKey("Nome do produto"), text: $productName)
                    .padding(5)
                    .foregroundColor(.gray)
                    .font(.custom("Avenir Next", size: 16))
                    .multilineTextAlignment(.leading)
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.gray), lineWidth: 1))
                    .onChange(of: productName) { _ in
                        self.addDesejoVM.nome = self.productName
                    }
                    .onTapGesture {
                        self.addDesejoVM.nome = self.productName
                    }

            }
            .padding(10)
            
            // PREÇO
            
            HStack() {
                Text(LocalizedStringKey("Preço:"))
                    .font(.custom("Avenir Next", size: 18))
                TextField(LocalizedStringKey("Preço do produto"), text: $productPrice)
                    .padding(5)
                    .foregroundColor(.gray)
                    .font(.custom("Avenir Next", size: 16))
                    .multilineTextAlignment(.leading)
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.gray), lineWidth: 1))
                    .keyboardType(.numberPad)
                    .onReceive(Just(productPrice)) { newValue in
                        let filtered = newValue.filter { "0123456789.,".contains($0) }
                        if filtered != newValue {
                            self.productPrice = String(filtered)
                            self.productPriceFiltered = filtered
                        }
                    }
                    .onChange(of: productPrice) { _ in
                        self.addDesejoVM.preco = self.productPriceFiltered
                    }
                    .onTapGesture {
                        self.addDesejoVM.preco = self.productPriceFiltered
                    }
            }
            .padding(10)
            
            // DESCRIÇÃO
            
            HStack() {
                Text(LocalizedStringKey("Descrição:"))
                    .font(.custom("Avenir Next", size: 18))
                TextField(LocalizedStringKey("Descrição do produto"), text: $productDescription)
                    .padding(5)
                    .foregroundColor(.gray)
                    .font(.custom("Avenir Next", size: 16))
                    .multilineTextAlignment(.leading)
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.gray), lineWidth: 1))
                    .onChange(of: productDescription) { _ in
                        self.addDesejoVM.descricao = self.productDescription
                    }
                    .onTapGesture {
                        self.addDesejoVM.descricao = self.productDescription
                    }
            }
            .padding(10)
            
            //LINK
            
            HStack() {
                Text(LocalizedStringKey("Link:"))
                    .font(.custom("Avenir Next", size: 18))
                TextField(LocalizedStringKey("Link do produto"), text: $productLink)
                    .padding(5)
                    .foregroundColor(.gray)
                    .font(.custom("Avenir Next", size: 16))
                    .multilineTextAlignment(.leading)
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.gray), lineWidth: 1))
                    .onChange(of: productLink) { _ in
                        self.addDesejoVM.link = self.productLink
                    }
                    .onTapGesture {
                        self.addDesejoVM.link = self.productLink
                    }
            }
            .padding(10)
        }
        .padding(15)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
    }
}

struct InformationsCard_Previews: PreviewProvider {
    static var previews: some View {
        let addDesejoVM = AddDesejoViewModel()
        InformationsCard(addDesejoVM: addDesejoVM)
            .previewDevice("iPhone 11")
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
