//
//  AddDesejoViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 19/07/21.
//

import Foundation
import CoreData

class AddDesejoViewModel: ObservableObject {
    
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
    
    // Cria um desejo com categoria e meta associadas
    func addDesejo() {
        let manager = CoreDataManager.shared
        let context = manager.persistentContainer.viewContext
        
        let desejo = Desejo(context: context)
        desejo.nome = nome
        desejo.descricao = descricao
        desejo.link = link
        desejo.preco = Double(preco) ?? 0.0
    
        let categoria = Categoria(context: context)
        categoria.nome = nomeCategoria
        categoria.cor = cor
        
        let meta = Meta(context: context)
        meta.duracao = Int16(duracao) ?? 0
        meta.frequencia = frequencia
        meta.valorAtual = Double(valorAtual) ?? 0.0
        meta.valorMeta = Double(valorMeta) ?? 0.0
        
        desejo.categoria = categoria
        desejo.meta =  meta
        
        manager.save()
        print("Salvou o desejo com categoria e meta associadas")
    }
    
    // Cria um desejo associado a uma categoria
    func addDesejoToCategoria(categoriaId: NSManagedObjectID) {
        
        let manager = CoreDataManager.shared
        
        let categoria: Categoria? = manager.getCategoriaById(id: categoriaId)
        
        if let categoria = categoria {
            let desejo = Desejo(context: manager.persistentContainer.viewContext)
            desejo.nome = nome
            desejo.descricao = descricao
            desejo.link = link
            desejo.preco = Double(preco) ?? 0.0
            desejo.categoria = categoria
            
            manager.save()
            print("Salvou o desejo!")
            
        }

    }
    
    // Cria um desejo que não está associado a nenhuma categoria
    func saveDesejo() {
        
        let manager = CoreDataManager.shared
        let desejo = Desejo(context: manager.persistentContainer.viewContext)
        desejo.nome = nome
        desejo.descricao = descricao
        desejo.link = link
        desejo.preco = Double(preco) ?? 0.0
        
        manager.save()
        print("Botao save desejo")
    }
    
}
