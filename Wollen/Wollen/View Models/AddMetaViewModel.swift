//
//  AddMetaViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 20/07/21.
//

import Foundation
import CoreData

class AddMetaViewModel: ObservableObject {
    
    var duracao: String = ""
    var frequencia: String = ""
    var valorAtual: String = ""
    var valorMeta: String = ""
    
    func addMetaToDesejo(desejoId: NSManagedObjectID) {
        
        let manager = CoreDataManager.shared
        
        let desejo: Desejo? = manager.getDesejoById(id: desejoId)
        
        if let desejo = desejo {
            let meta = Meta(context: manager.persistentContainer.viewContext)
            meta.duracao = Int16(duracao) ?? 0
            meta.frequencia = frequencia
            meta.valorAtual = Double(valorAtual) ?? 0.0
            meta.valorMeta = Double(valorMeta) ?? 0.0
            meta.desejo = desejo
            
            manager.save()
            print("Salvou a meta!")
        }
        
    }
    
    func saveMeta() {
        
        let manager = CoreDataManager.shared
        let meta = Meta(context: manager.persistentContainer.viewContext)
        meta.duracao = Int16(duracao) ?? 0
        meta.frequencia = frequencia
        meta.valorAtual = Double(valorAtual) ?? 0.0
        meta.valorMeta = Double(valorMeta) ?? 0.0
        
        manager.save()
        print("Salvou a meta!")
    }
    
}
