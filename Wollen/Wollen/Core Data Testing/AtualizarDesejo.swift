//
//  AtualizarDesejo.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 23/07/21.
//

import SwiftUI

struct AtualizarDesejo: View {
    
    // TO DO: Recuperar informação que vai ser exibida no textfield, pra que se não mudar, permaneça o que tinha anteriormente
    
    @StateObject private var updateDesejoVM = UpdateDesejoViewModel()
    
    let desejoVM: DesejoViewModel
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                VStack(spacing: 5) {
                    Text("Informações")
                        .bold()
                    TextField("Nome", text: $updateDesejoVM.nome)
                    TextField("Preco", text: $updateDesejoVM.preco)
                    TextField("Descricao", text: $updateDesejoVM.descricao)
                    TextField("Link", text: $updateDesejoVM.link)
                }.padding()
                
                VStack(spacing: 5) {
                    Text("Categoria")
                        .bold()
                    TextField("Nome categoria", text: $updateDesejoVM.nomeCategoria)
                    TextField("Cor", text: $updateDesejoVM.cor)
                }.padding()
                
                VStack(spacing: 5) {
                    Text("Meta")
                        .bold()
                    TextField("Valor Meta", text: $updateDesejoVM.valorMeta)
                    TextField("Valor Atual", text: $updateDesejoVM.valorAtual)
                    TextField("Duração", text: $updateDesejoVM.duracao)
                    TextField("Frequência", text: $updateDesejoVM.frequencia)
                }.padding()
            }
        
            ImageCard()
            Button("Salvar") {
                updateDesejoVM.updateDesejo(desejoSelecionado: desejoVM)
            }
        }
    }
}

struct AtualizarDesejo_Previews: PreviewProvider {
    static var previews: some View {
        let desejoVM = DesejoViewModel(desejo: Desejo(context: CoreDataManager.shared.viewContext))
        AtualizarDesejo(desejoVM: desejoVM)
    }
}
