//
//  ListaDesejosView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 19/07/21.
//

import SwiftUI

struct ListaDesejosView: View {
    
    @State private var isPresented: Bool = false
    @StateObject private var listaDesejosVM = ListaDesejosViewModel()
    
    var body: some View {
        List{
            ForEach(listaDesejosVM.desejos, id: \.id) { desejo in
                
                NavigationLink(
                    destination: DesejoView(desejoVM: desejo),
                    label: {
                        DetalhesDesejo(desejo: desejo)
                    })
                
            }
        }
        .navigationTitle("Meus desejos")
        .navigationBarItems(trailing: Button("Novo desejo") {
             isPresented = true
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            listaDesejosVM.getAllDesejos()
        }, content: {
            InformationsCard()
        })
        .onAppear(perform: {
            listaDesejosVM.getAllDesejos()
        })
    }
}

struct ListaDesejosView_Previews: PreviewProvider {
    static var previews: some View {
        ListaDesejosView()
    }
}

struct DetalhesDesejo: View {
    
    let desejo: DesejoViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(desejo.nome)
                .fontWeight(.bold)
            Text("R$ " + String(desejo.preco))
            Text("Descrição " + desejo.descricao)
            Text("Link " + desejo.link)

        }
    }
}
