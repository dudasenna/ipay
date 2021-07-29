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
                Button(action: {
                    print("cor yellow")
                    $addCategoriaVM.cor
                }, label: {
                    Circle()
                        .frame(width: 30, height:30, alignment: .leading)
                        .foregroundColor(Color(UIColor(named: "systemYellow")!))
                })
                Button(action: {
                    print("cor purple")
                }, label: {
                    Circle()
                        .frame(width: 30, height:30, alignment: .leading)
                        .foregroundColor(Color(UIColor(named: "systemPurple")!))
                })
                Button(action: {
                    print("cor orange")
                }, label: {
                    Circle()
                        .frame(width: 30, height:30, alignment: .leading)
                        .foregroundColor(Color(UIColor(named: "systemOrange")!))
                })
                Button(action: {
                    print("cor green")
                }, label: {
                    Circle()
                        .frame(width: 30, height:30, alignment: .leading)
                        .foregroundColor(Color(UIColor(named: "systemGreen")!))
                })
                Button(action: {
                    print("cor red")
                }, label: {
                    Circle()
                        .frame(width: 30, height:30, alignment: .leading)
                        .foregroundColor(Color(UIColor(named: "systemPink")!))
                })
                Button(action: {
                    print("cor mint")
                }, label: {
                    Circle()
                        .frame(width: 30, height:30, alignment: .leading)
                        .foregroundColor(Color(UIColor(named: "systemMint")!))
                })
                
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
