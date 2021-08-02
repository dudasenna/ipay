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
    
    @StateObject private var listaMidiasVM = ListaMidiasViewModel()
    
    var body: some View {
        VStack(spacing: 5){
            Group {
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
                
            }
            
            
            // Mostrar informações sobre a meta
            Text("Informações sobre a meta")
                .font(.title)
            Text("Valor atual " + String(desejoVM.desejo.meta?.valorAtual ?? 0.0))
            Text("Valor meta " + String(desejoVM.desejo.meta?.valorMeta ?? 0.0))
            Text("Frequência " + (desejoVM.desejo.meta?.frequencia ?? "não consegui pegar a frequencia"))
            Text("Duração " + String(desejoVM.desejo.meta?.duracao ?? 0))

//            let metaVM = listaMetasVM.returnMetaFromDesejo(desejo: desejoVM)
//            // Só tenta exibir detalhes da meta se a meta existirs
//
//            if let metaVM = metaVM {
//                DetalhesMeta(meta: metaVM)
//            } else {
//                Text("A meta não existe :(")
//            }
//
            // Mostrar informações sobre as midias
            Text("Informações sobre as midias")
                .font(.title)
            MidiaView()
            
            Button {
                isPresented.toggle()
            } label: {
                Text("Editar desejo")
            }
            .sheet(isPresented: $isPresented, onDismiss: {
                
                // Atualizar as informações exibidas do desejo
                //listaCategoriasVM.getAllCategorias()
            }, content: {
                AtualizarDesejo(desejoVM: desejoVM)
            })
            
            
        }
    }
}

struct DesejoView_Previews: PreviewProvider {
    static var previews: some View {
        
        let desejoVM = DesejoViewModel(desejo: Desejo(context: CoreDataManager.shared.viewContext))
        DesejoView(desejoVM: desejoVM)
    }
}
