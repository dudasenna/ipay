//
//  EditInformationsCard.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 04/08/21.
//

import SwiftUI
import Combine

struct EditInformationsCard: View {
    init(addDesejoVM: AddDesejoViewModel, desejoVM: DesejoViewModel) {
        self.addDesejoVM = addDesejoVM
        self.desejoVM = desejoVM
    }
    var desejoVM: DesejoViewModel
    @ObservedObject var addDesejoVM: AddDesejoViewModel
    @State private var productName: String = ""
    @State private var productPrice: String = ""
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
                TextField(
                    desejoVM.nome,
                    text: $productName
                )
                    .padding(5)
                    .foregroundColor(Color("preto_primario"))
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
            .onAppear() {
                self.productName =  desejoVM.nome
            }
            // PREÇO
            
            HStack() {
                Text(LocalizedStringKey("Preço:"))
                    .font(.custom("Avenir Next", size: 18))
                TextField(String(desejoVM.preco), text: $productPrice)
                    .padding(5)
                    .foregroundColor(Color("preto_primario"))
                    .font(.custom("Avenir Next", size: 16))
                    .multilineTextAlignment(.leading)
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.gray), lineWidth: 1))
                    .keyboardType(.numberPad)
                    .onReceive(Just(productPrice)) { newValue in
                        let filtered = newValue.filter { "0123456789.,".contains($0) }
                        if filtered != newValue {
                            self.productPrice = String(filtered)
                        }
                    }
                    .onChange(of: productPrice) { _ in
                        self.addDesejoVM.preco = self.productPrice
                    }
                    .onTapGesture {
                        self.addDesejoVM.preco = self.productPrice
                    }
            }
            .padding(10)
            
            // DESCRIÇÃO
            
            HStack() {
                Text(LocalizedStringKey("Descrição:"))
                    .font(.custom("Avenir Next", size: 18))
                TextField(desejoVM.descricao, text: $productDescription)
                    .padding(5)
                    .foregroundColor(Color("preto_primario"))
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
                TextField(desejoVM.link, text: $productLink)
                    .padding(5)
                    .foregroundColor(Color("preto_primario"))
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

struct EditInformationsCard_Previews: PreviewProvider {
    static var previews: some View {
        let addDesejoVM = AddDesejoViewModel()
        let desejoVM = DesejoViewModel(desejo: Desejo(context: CoreDataManager.shared.viewContext))
        EditInformationsCard(addDesejoVM: addDesejoVM, desejoVM: desejoVM)
            .previewDevice("iPhone 11")
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
