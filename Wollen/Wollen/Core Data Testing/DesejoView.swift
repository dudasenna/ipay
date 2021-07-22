//
//  DesejoView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 20/07/21.
//

import SwiftUI

struct DesejoView: View {
    
    @State private var isPresented: Bool = false
    
    let desejoVM: DesejoViewModel
    
    var body: some View {
        VStack{
            DetalhesDesejo(desejo: desejoVM)
            Text(desejoVM.desejo.categoria?.cor ?? "não consegui pegar a cor")
                .font(.footnote)
            //Text(desejoVM.desejo.meta?.valorMeta ?? "")
            Button {
                isPresented.toggle()
            } label: {
                Text("Adicionar meta")
                    .font(.title2)
            }
            .sheet(isPresented: $isPresented, onDismiss: {
                DetalhesDesejo(desejo: desejoVM)
            }, content: {
                AddMetaToDesejoView(desejoVM: desejoVM)
            })
            
            Button {
                isPresented.toggle()
            } label: {
                Text("Adicionar categoria")
                    .font(.title2)
            }
            .sheet(isPresented: $isPresented, onDismiss: {
                DetalhesDesejo(desejo: desejoVM)
            }, content: {
                //AddCategoriaViewToDesejo(desejoVM: desejoVM)
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
