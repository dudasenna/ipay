//
//  DetalhesDesejo.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 04/08/21.
//

import Foundation
import SwiftUI

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
