//
//  ListaDesejosView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 19/07/21.
//

import SwiftUI

struct ListaDesejosView: View {
    
    @StateObject private var listaDesejosVM = ListaDesejosViewModel()
    
    var body: some View {
        List{
            ForEach(listaDesejosVM.desejos, id: \.id) { desejo in
                //Text(desejo.nome)
                DetalhesDesejo(desejo: desejo)
            }
        }
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
                .font(.system(size: 22))
            Text(desejo.descricao)
                .font(.callout)
                .opacity(0.5)
            Text(desejo.link)
                .font(.callout)
                .opacity(0.5)
            
        }
    }
}
