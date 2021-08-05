//
//  AddWish.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 31/07/21.
//

import SwiftUI

struct AddWishCards: View {
    @StateObject private var addDesejoVM = AddDesejoViewModel()
    
    @Environment(\.presentationMode) var presentation
    @State private var showingAlert = false
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        
        VStack (alignment: .center, spacing: 30) {
            
            HStack (alignment: .top){
                Text(LocalizedStringKey("Adicionar desejo"))
                .bold()
                .font(.custom("Avenir Next", size: 30))
                
                Spacer()
                
                NavigationLink(
                    destination:
                        HomeView(),
                    label: {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(Color(UIColor(named: "systemMint")!))
                            .imageScale(.large)
                        
                    })
            }
            
//            HStack (alignment: .top, spacing: 30) {
//                InformationsCard(addDesejoVM: addDesejoVM)
//                CategoriesCard(addDesejoVM: addDesejoVM)
//            }
//
//            HStack (alignment: .top, spacing: 30) {
//
//                ImageCard(addDesejoVM: addDesejoVM)
//                GoalCard(desejo: addDesejoVM)
//            }
            
            Group {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    // iPhone Portrait or iPad 1/3 split view for Multitasking for instance
                    ScrollView {
                        VStack (alignment: .center, spacing: 30){
                            InformationsCard(addDesejoVM: addDesejoVM)
                            CategoriesCard(addDesejoVM: addDesejoVM)
                            ImageCard(addDesejoVM: addDesejoVM)
                            GoalCard(desejo: addDesejoVM)
                        }
                    }
                }
                if verticalSizeClass == .compact && horizontalSizeClass == .compact {
                    // some "standard" iPhone Landscape (iPhone SE, X, XS, 7, 8, ...)
                    ScrollView {
                        VStack (alignment: .center, spacing: 30){
                            InformationsCard(addDesejoVM: addDesejoVM)
                            CategoriesCard(addDesejoVM: addDesejoVM)
                            ImageCard(addDesejoVM: addDesejoVM)
                            GoalCard(desejo: addDesejoVM)
                        }
                    }
                } else if verticalSizeClass == .compact && horizontalSizeClass == .regular {
                    // some "bigger" iPhone Landscape (iPhone Xs Max, 6s Plus, 7 Plus, 8 Plus, ...)
                    ScrollView {
                        VStack (alignment: .center, spacing: 30){
                            InformationsCard(addDesejoVM: addDesejoVM)
                            CategoriesCard(addDesejoVM: addDesejoVM)
                            ImageCard(addDesejoVM: addDesejoVM)
                            GoalCard(desejo: addDesejoVM)
                        }
                    }
                } else if verticalSizeClass == .regular && horizontalSizeClass == .regular {
                    // macOS or iPad without split view - no Multitasking
                    HStack (alignment: .top, spacing: 30) {
                        InformationsCard(addDesejoVM: addDesejoVM)
                        CategoriesCard(addDesejoVM: addDesejoVM)
                    }
                    
                    HStack (alignment: .top, spacing: 30) {
                        ImageCard(addDesejoVM: addDesejoVM)
                        GoalCard(desejo: addDesejoVM)
                    }
                }
            }
            
            
            Button {
                //addDesejoVM.addDesejo()
                // Caso tenha alguma informação faltando, não salva
                if(addDesejoVM.cor.isEmpty || addDesejoVM.preco.isEmpty || addDesejoVM.nome.isEmpty || addDesejoVM.descricao.isEmpty || addDesejoVM.link.isEmpty) {
                    showingAlert = true
                }
                else {
                addDesejoVM.addDesejoToCategoria(categoriaId: addDesejoVM.categoriaId!)
                    
                // Quando salva, volta para a Home
                self.presentation.wrappedValue.dismiss()
                }
                
    
            } label: {
                Text(LocalizedStringKey("Salvar"))
                    .foregroundColor(Color(UIColor(named: "preto_primario")!))
                    .font(.custom("Avenir Next", size: 18).bold())
                    .padding(5)
            }
            //.disabled(addDesejoVM.cor.isEmpty)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(LocalizedStringKey("Information missing")), message: Text(LocalizedStringKey("Please make sure you have defined the details of your wish")), dismissButton: .default(Text("OK")))
            }
            .padding(5)
            .background(Color(UIColor(named: "systemMint")!))
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.4), radius: 5)

        }
        .padding(30)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
        
        
    }
}

struct AddWishCards_Previews: PreviewProvider {
    static var previews: some View {
        AddWishCards()
    }
}
