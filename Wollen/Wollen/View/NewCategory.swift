//
//  NewCategory.swift
//  Wollen
//
//  Created by Palloma Ramos on 28/07/21.
//

import SwiftUI

struct NewCategory : View {
    
    @StateObject private var addCategoriaVM = AddCategoriaViewModel()
    
    @State private var showingDetail = false
    var colorNames: [String] = ["systemYellow", "systemPurple", "systemOrange", "systemGreen", "systemPink", "systemCyan"]
    @State private var colorSelected: String = "systemYellow"
    
    var body: some View {
        VStack{
            Text(LocalizedStringKey("Nova Categoria"))
                .bold()
                .font(.custom("Avenir Next", size: 22))
                .foregroundColor(.black)
            TextField(LocalizedStringKey("Nome da categoria"), text: $addCategoriaVM.nome)
                .padding(5)
                .background(Color(red: 118/256, green: 118/256, blue: 128/256, opacity: 0.12))
                .cornerRadius(10)
                .multilineTextAlignment(.center)
                .font(.custom("Avenir Next", size: 16))
            
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
//                Button(action: {
//
//                }, label: {
//                    Text("Cancelar")
//                })
                Button(LocalizedStringKey("Cancelar")) {
                           showingDetail = true
                       }
                       .sheet(isPresented: $showingDetail) {
                           ListaCategoriasView()
                       }
                .font(.custom("Avenir Next", size: 18))
                .foregroundColor(Color(UIColor.darkGray))
                .padding()
                Spacer()

                Button(
                    action: {
                    },
                    label: {
                        Text(LocalizedStringKey("Criar"))
                            .foregroundColor(Color(UIColor.darkGray))
                            .font(.custom("Avenir", size: 18).bold())
                            .padding(.horizontal)
                    }
                )
                .background(RoundedRectangle(cornerRadius: 5))
                .foregroundColor(Color(UIColor(named: "systemMint")!))
                .padding()
            
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
