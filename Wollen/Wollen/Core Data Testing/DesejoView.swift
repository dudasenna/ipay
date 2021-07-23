//
//  DesejoView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 20/07/21.
//

import SwiftUI

struct DesejoView: View {
    
    // Exibe as informações do desejo
    
    @State private var isPresented: Bool = false
    
    let desejoVM: DesejoViewModel
    
    @StateObject private var listaMetasVM = ListaMetasViewModel()
    
    var body: some View {
        VStack(spacing: 5){
            // Mostrar informações sobre o desejo
            Text("Informações sobre o desejo")
                .font(.title)
                .bold()
            DetalhesDesejo(desejo: desejoVM)
            
            // Mostrar informações sobre a categoria
            Text("Informações sobre a categoria")
                .font(.title)
            Text(desejoVM.desejo.categoria?.nome ?? "não consegui pegar a categoria")
            Text(desejoVM.desejo.categoria?.cor ?? "não consegui pegar a cor")
            Text("Informações sobre a meta")
                .font(.title)
            
            // Mostrar informações sobre a meta
            let metaVM = listaMetasVM.returnMetaFromDesejo(desejo: desejoVM)
            // Só tenta exibir detalhes da meta se a meta existir
            if let metaVM = metaVM {
                DetalhesMeta(meta: metaVM)
            } else {
                Text("A meta não existe :(")
            }
            
        }
    }
}

struct DesejoView_Previews: PreviewProvider {
    static var previews: some View {
        
        let desejoVM = DesejoViewModel(desejo: Desejo(context: CoreDataManager.shared.viewContext))
        DesejoView(desejoVM: desejoVM)
    }
}
