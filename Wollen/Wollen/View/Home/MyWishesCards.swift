//
//  MyWishesCards.swift
//  Wollen
//
//  Created by Eduarda Senna on 13/07/21.
//

import SwiftUI

struct MyWishesCards: View {
    
    @StateObject private var listaDesejosVM = ListaDesejosViewModel()
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack (alignment: .top){
                VStack (alignment: .leading){
                    Text(LocalizedStringKey("Meus desejos"))
                        .bold()
                        .font(.custom("Avenir Next", size: 30))
                    Text(LocalizedStringKey("Geral"))
                        .font(.custom("Avenir Next", size: 22))
                }
                Spacer()
                
                NavigationLink(
                    destination:
                        //AddDesejoCompleto(),
                        AddWishView(),
                    label: {
                        Image(systemName: "plus.circle")
                            .foregroundColor(Color(UIColor(named: "systemMint")!))
                            .imageScale(.large)
                        
                    })

            }
            .padding()
            
            
            ScrollView(.horizontal) {
                HStack(spacing: 30) {
                    ForEach(listaDesejosVM.desejos, id: \.id) { desejo in
                        
                        // Exibe a lista de desejos
                        NavigationLink(
                            destination:
                                //DesejoView(desejoVM: desejo),
                                DetailView(),
                            label: {
                                MyWishCard(desejoVM: desejo)
                                    .foregroundColor(Color(UIColor(named: "preto_primario")!))
                            })
                        
                    }
                }
            }
            
            .padding()
            .shadow(color: Color.gray.opacity(0.2), radius: 5)
            //gostei mais da sombra no tom natural
        }
        .onAppear(perform: {
            listaDesejosVM.getAllDesejos()
        })
        .padding(20)
        .padding(.leading, 10)
        .background(Color(red: 256/256, green: 256/256, blue: 256/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

struct MyWishesCards_Previews: PreviewProvider {
    static var previews: some View {
        MyWishesCards()
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
