//
//  AddMetaView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 21/07/21.
//

import SwiftUI

struct AddMetaToDesejoView: View {
    
    // Esta view não está sendo usada no momento.
    
    @StateObject private var addMetaVM = AddMetaViewModel()

    let desejoVM: DesejoViewModel
    
    var body: some View {
        VStack {
            TextField("Valor Meta", text: $addMetaVM.valorMeta)
            TextField("Valor Atual", text: $addMetaVM.valorAtual)
            //TextField("Duração", text: $addMetaVM.duracao)
            TextField("Frequência", text: $addMetaVM.frequencia)
            Button("Salvar") {
                addMetaVM.addMetaToDesejo(desejoId: desejoVM.id)
            }
        }.padding()
    }
}

struct AddMetaView_Previews: PreviewProvider {
    static var previews: some View {
        let desejoVM = DesejoViewModel(desejo: Desejo(context: CoreDataManager.shared.viewContext))
        AddMetaToDesejoView(desejoVM: desejoVM)
    }
}
