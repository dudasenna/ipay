//
//  AddDesejoCompleto.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 22/07/21.
//

import SwiftUI

struct AddDesejoCompleto: View {
    
    @StateObject private var addDesejoVM = AddDesejoViewModel()
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                VStack(spacing: 5) {
                    Text("Informações")
                        .bold()
                    TextField("Nome", text: $addDesejoVM.nome)
                    TextField("Preco", text: $addDesejoVM.preco)
                    TextField("Descricao", text: $addDesejoVM.descricao)
                    TextField("Link", text: $addDesejoVM.link)
                }.padding()
                
                
                
                VStack(spacing: 5) {
                    Text("Categoria")
                        .bold()
                    TextField("Nome categoria", text: $addDesejoVM.nomeCategoria)
                    TextField("Cor", text: $addDesejoVM.cor)
                }.padding()
                
                VStack(spacing: 5) {
                    Text("Meta")
                        .bold()
                    TextField("Valor Meta", text: $addDesejoVM.valorMeta)
                    TextField("Valor Atual", text: $addDesejoVM.valorAtual)
                    TextField("Duração", text: $addDesejoVM.duracao)
                    TextField("Frequência", text: $addDesejoVM.frequencia)
                }.padding()
            }
            HStack {
                InformationsCard(addDesejoVM: addDesejoVM)
                CategoriesCard(addDesejoVM: addDesejoVM)
                ImageCard(addDesejoVM: addDesejoVM)
            }
            
            
            
            Button("Salvar") {
                addDesejoVM.addDesejo()
            }
        }
        
    }
}

struct AddDesejoCompleto_Previews: PreviewProvider {
    static var previews: some View {
        AddDesejoCompleto()
    }
}
