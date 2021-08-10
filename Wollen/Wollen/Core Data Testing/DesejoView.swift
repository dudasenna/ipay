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
    @State private var valorAtual: Double = 0.0
    
    let desejoVM: DesejoViewModel
    
    @StateObject private var listaDesejosVM = ListaDesejosViewModel()
    @StateObject private var listaMetasVM = ListaMetasViewModel()
    
    let pub = NotificationCenter.default.publisher(for: NSNotification.Name("atualiza_valor_atual"))
    
    var body: some View {
        VStack(spacing: 5){
            // Mostrar informações sobre o desejo
            Text("Informações sobre o desejo")
                .font(.title)
                .bold()
            DetalhesDesejo(desejo: desejoVM)
            CardSaveMoney(desejo: desejoVM)
            
            // Mostrar informações sobre a categoria
            Text("Informações sobre a categoria")
                .font(.title)
            Text(desejoVM.desejo.categoria?.nome ?? "não consegui pegar a categoria")
            Text(desejoVM.desejo.categoria?.cor ?? "não consegui pegar a cor")
            
            
            // Mostrar informações sobre a meta
            //Text("Informações sobre a meta").font(.title)
            //let metaVM = listaMetasVM.returnMetaFromDesejo(desejo: desejoVM)
            //let _ = print("Entrou: \(Date())")
            // Só tenta exibir detalhes da meta se a meta existir
            //            if let metaVM = desejoVM.desejo.meta {
            //                let metaVM =
            //                    DetalhesMeta(meta: metaVM.desejo!.meta.)
            //                let _ = print(desejoVM.desejo.meta?.valorAtual)
            //            } else {
            //                Text("A meta não existe :(")
            //            }
            Group { // Estamos usando Group pois não pode colocar muitos elementos
                Text("Informações sobre a meta")
                    .font(.title)
                ForEach(listaDesejosVM.desejos, id: \.id) { desejo in
                    if desejo.id == desejoVM.id {
                        Text("Valor atual " + String(desejo.desejo.meta?.valorAtual ?? 0.0))
                        Text("Valor meta " + String(desejo.desejo.meta?.valorMeta ?? 0.0))
                        Text("Frequência " + (desejo.desejo.meta?.frequencia ?? "não consegui pegar a frequencia"))
                        Text("Duração " + String(desejo.desejo.meta?.duracao ?? 0))
                    }
                }
            }
            
            // Mostrar informações sobre as midias
            Text("Informações sobre as midias")
                .font(.title)
            MidiaView(desejoVM: desejoVM)
            
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
        .onAppear(perform: {
            listaDesejosVM.getAllDesejos()
        })
        .onReceive(pub, perform: { _ in
            listaDesejosVM.getAllDesejos()
        })
    }
}

struct DesejoView_Previews: PreviewProvider {
    static var previews: some View {
        
        let desejoVM = DesejoViewModel(desejo: Desejo(context: CoreDataManager.shared.viewContext))
        DesejoView(desejoVM: desejoVM)
    }
}
