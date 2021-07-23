//
//  UpdateDesejo.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 23/07/21.
//

import Foundation
import CoreData

class UpdateDesejoViewModel: ObservableObject {
    
    // Atributos do Desejo
    var nome: String = ""
    var descricao: String = ""
    var link: String = ""
    var preco: String = ""
    
    // Atributos da Categoria
    var nomeCategoria: String = ""
    var cor: String = ""
    
    // Atributos da Meta
    var duracao: String = ""
    var frequencia: String = ""
    var valorAtual: String = ""
    var valorMeta: String = ""
    
    // Atualiza um desejo pelo Object ID
    func updateDesejo(desejoSelecionado: DesejoViewModel) {
        let desejo = CoreDataManager.shared.getDesejoById(id: desejoSelecionado.id)
        if let desejo = desejo {
            desejo.nome = nome
            desejo.descricao = descricao
            desejo.link = link
            desejo.preco = Double(preco) ?? 0.0
            
            // Buscar a categoria do desejo
            // TO DO
            
            // Se a categoria existir, atualiza a categoria
            desejo.categoria?.nome = nomeCategoria
            desejo.categoria?.cor = cor
            
            // Se a categoria não existir, criar a categoria
            // TO DO
            
            desejo.meta?.duracao = Int16(duracao) ?? 0
            desejo.meta?.frequencia = frequencia
            desejo.meta?.valorAtual = Double(valorAtual) ?? 0.0
            desejo.meta?.valorMeta = Double(valorMeta) ?? 0.0
            
            CoreDataManager.shared.save()
            print("Atualizou o desejo com categoria e meta associadas")
        }
    }
    
}

