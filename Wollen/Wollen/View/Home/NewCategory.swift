//
//  NewCategory.swift
//  Wollen
//
//  Created by Palloma Ramos on 28/07/21.
//

import SwiftUI

struct NewCategory : View {
    
    @StateObject private var addCategoriaVM = AddCategoriaViewModel()
    
    @Environment(\.presentationMode) var presentation
    
    var colorNames: [String] = ["systemYellow", "systemPurple", "systemOrange", "systemGreen", "systemPink", "systemCyan"]
    @State private var colorSelected: String = "systemYellow"
    
    var body: some View {
        VStack(spacing: 20){
            Text(LocalizedStringKey("Nova categoria"))
                .bold()
                .font(.custom("Avenir Next", size: 22))
                .foregroundColor(.black)
            TextField(LocalizedStringKey("Nome da categoria"), text: $addCategoriaVM.nome)
                .foregroundColor(.black)
                .padding(5)
                .font(.custom("Avenir Next", size: 16))
                .multilineTextAlignment(.leading)
                .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.gray), lineWidth: 1))
            
            HStack{
                ForEach(self.colorNames, id: \.self) { colorName in
                    Button(
                        action: {
                            colorSelected = colorName
                            addCategoriaVM.cor = colorName
                        },
                        label: {
                            if colorName == colorSelected {
                                ZStack {
                                    Circle()
                                        .frame(width: 20, height:20, alignment: .leading)
                                        .foregroundColor(Color(UIColor(named: "\(colorName)")!))
                                    Circle()
                                        .stroke(Color(UIColor(named: "preto_primario")!), style: .init(lineWidth: 3))
                                        .frame(width: 30, height:30, alignment: .leading)
                                }
                            } else {
                                Circle()
                                    .frame(width: 30, height:30, alignment: .leading)
                                    .foregroundColor(Color(UIColor(named: "\(colorName)")!))
                            }
                        }
                    )
                }
            }
            HStack{
                Button(LocalizedStringKey("Cancelar")) {
                    self.presentation.wrappedValue.dismiss()
                       }
                .font(.custom("Avenir Next", size: 18))
                .foregroundColor(Color(UIColor.darkGray))
                .padding()
                Spacer()

                Button(
                    action: {
                        if addCategoriaVM.cor == "" {
                            addCategoriaVM.cor = colorSelected
                        }
                        self.addCategoriaVM.saveCategoria()
                        self.presentation.wrappedValue.dismiss()
                    },
                    label: {
                        Text(LocalizedStringKey("Criar"))
                            .foregroundColor(Color(UIColor(named: "preto_primario")!))
                            .font(.custom("Avenir Next", size: 18).bold())
                            .padding(5)
                    }
                )
                .padding(5)
                .background(Color(UIColor(named: "systemMint")!))
                .cornerRadius(10)
                
            
        }
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(20)
    }
        .padding(10)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
        .frame(minWidth: 100, idealWidth: 278, maxWidth: 278, minHeight: 200, idealHeight: 390, maxHeight: 390, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
    
}

struct NewCategory_Previews: PreviewProvider {
    static var previews: some View {
        NewCategory()
            .previewDevice("iPhone 11")
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
