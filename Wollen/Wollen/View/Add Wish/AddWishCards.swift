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
            
            HStack (alignment: .top, spacing: 30) {
                InformationsCard(addDesejoVM: addDesejoVM)
                CategoriesCard(addDesejoVM: addDesejoVM)
            }
            
            HStack (alignment: .top, spacing: 30) {

                ImageCard(addDesejoVM: addDesejoVM)
                GoalCard(desejo: addDesejoVM)
            }
            
            
            Button {
                //addDesejoVM.addDesejo()
                // Caso tenha alguma informação faltando, não salva
                if(addDesejoVM.cor.isEmpty || addDesejoVM.preco.isEmpty || addDesejoVM.nome.isEmpty || addDesejoVM.descricao.isEmpty || addDesejoVM.link.isEmpty || (addDesejoVM.tipo == "Por valor" && (addDesejoVM.frequencia.isEmpty || addDesejoVM.valorMeta.isEmpty)) || (addDesejoVM.tipo == "Por período" && (addDesejoVM.frequencia.isEmpty || addDesejoVM.duracao == 0 || addDesejoVM.duracao2.isEmpty))) {
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
