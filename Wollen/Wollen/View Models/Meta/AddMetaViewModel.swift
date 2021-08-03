//
//  AddMetaViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 20/07/21.
//

import Foundation
import CoreData

class AddMetaViewModel: ObservableObject {
    
    // Não está sendo usado, porque a meta está sendo criada apenas quando se cria um desejo 
    
    var duracao: Int = 0
    var duracao2: String = ""
    var frequencia: String = ""
    var valorAtual: String = ""
    var valorMeta: String = ""
    var tipo: String = ""
    
    // Adicionar uma meta a um desejo existente
    func addMetaToDesejo(desejoId: NSManagedObjectID) {
        
        let manager = CoreDataManager.shared
        
        let desejo: Desejo? = manager.getDesejoById(id: desejoId)
        
        if let desejo = desejo {
            let meta = Meta(context: manager.persistentContainer.viewContext)
            meta.duracao = Int16(duracao)
            meta.duracao2 = duracao2
            meta.frequencia = frequencia
            meta.valorAtual = Double(valorAtual) ?? 0.0
            meta.valorMeta = Double(valorMeta) ?? 0.0
            meta.desejo = desejo
            meta.tipo = tipo
            
            manager.save()
            print("Salvou a meta!")
        }
        
    }
    
    // Adicionar uma meta existente a um desejo existente
    func addMetaToDesejo(desejoId: NSManagedObjectID, metaId: NSManagedObjectID) {
        
        let manager = CoreDataManager.shared
        
        let desejo: Desejo? = manager.getDesejoById(id: desejoId)
        
        let meta: Meta? = manager.getMetaById(id: metaId)
        
        if let desejo = desejo {
            if let meta = meta {
                desejo.meta = meta
                
                manager.save()
            }
        }
    }
    
    // Criar uma meta que não está associada a nenhum desejo
    func saveMeta() {
        
        let manager = CoreDataManager.shared
        let meta = Meta(context: manager.persistentContainer.viewContext)
        meta.duracao = Int16(duracao) 
        meta.duracao2 = duracao2
        meta.frequencia = frequencia
        meta.valorAtual = Double(valorAtual) ?? 0.0
        meta.valorMeta = Double(valorMeta) ?? 0.0
        meta.tipo = tipo
        
        manager.save()
        print("Salvou a meta!")
    }
    
}
