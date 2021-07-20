//
//  AddMetaViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 20/07/21.
//

import Foundation
import CoreData

class AddMetaViewModel: ObservableObject {
    
    var duracao: Int16 = 0
    var frequencia: String = ""
    var valorAtual: Double = 0.0
    var valorMeta: Double = 0.0
    
    func addMetaToDesejo(desejoId: NSManagedObjectID) {
        
        let manager = CoreDataManager.shared
        
        let desejo: Desejo? = manager.getDesejoById(id: desejoId)
        
        if let desejo = desejo {
            let meta = Meta(context: manager.persistentContainer.viewContext)
            meta.duracao = duracao
            meta.frequencia = frequencia
            meta.valorAtual = valorAtual
            meta.valorMeta = valorMeta
            meta.desejo = desejo
            
            manager.save()
            print("Salvou a meta!")
        }
        
    }
    
    func saveMeta() {
        
        let manager = CoreDataManager.shared
        let meta = Meta(context: manager.persistentContainer.viewContext)
        meta.duracao = duracao
        meta.frequencia = frequencia
        meta.valorAtual = valorAtual
        meta.valorMeta = valorMeta
        
        manager.save()
        print("Salvou a meta!")
    }
    
}
