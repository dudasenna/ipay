//
//  MetaView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 23/07/21.
//

import SwiftUI

struct DetalhesMeta: View {
    
    let meta: MetaViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Duracao " + String(meta.duracao))
            Text("Frequencia " + meta.frequencia)
            Text("Valor Atual R$ " + String(meta.valorAtual))
            Text("Valor Meta R$ " + String(meta.valorMeta))
        }
    }
}
