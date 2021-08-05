//
//  EditWishCards.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 04/08/21.
//

import SwiftUI

struct EditWishCards: View {
    @StateObject private var addDesejoVM = AddDesejoViewModel()
    
    let desejoVM: DesejoViewModel
    @Environment(\.presentationMode) var presentation
    @State private var showingAlert = false
    
    var body: some View {
        
        VStack (alignment: .center, spacing: 30) {
            
            HStack (alignment: .top){
                Text(LocalizedStringKey("Editar desejo"))
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
                EditInformationsCard(addDesejoVM: addDesejoVM, desejoVM: desejoVM)
                CategoriesCard(addDesejoVM: addDesejoVM)
            }
            
            HStack (alignment: .top, spacing: 30) {

                ImageCard(addDesejoVM: addDesejoVM)
                GoalCard(desejo: addDesejoVM)
            }
            
            
            Button {
                //addDesejoVM.addDesejo()
                // Caso tenha alguma informação faltando, pegar do desejo
//                if(addDesejoVM.cor.isEmpty || addDesejoVM.preco.isEmpty || addDesejoVM.nome.isEmpty || addDesejoVM.descricao.isEmpty || addDesejoVM.link.isEmpty) {
//                    //showingAlert = true
//                }
//                else {
                    // Edita o desejo
                print("atualizar")
                addDesejoVM.updateDesejo(desejoSelecionado: desejoVM)
                    
                // Quando salva, volta para a Home
                self.presentation.wrappedValue.dismiss()
//                }
                
    
            } label: {
                Text(LocalizedStringKey("Salvar"))
                    .foregroundColor(Color(UIColor(named: "preto_primario")!))
                    .font(.custom("Avenir Next", size: 18).bold())
                    .padding(5)
            }
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

struct EditWishCards_Previews: PreviewProvider {
    static var previews: some View {
        let desejoVM = DesejoViewModel(desejo: Desejo(context: CoreDataManager.shared.viewContext))
        EditWishCards(desejoVM: desejoVM)
    }
}
