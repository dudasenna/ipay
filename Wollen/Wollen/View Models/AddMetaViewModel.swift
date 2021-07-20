//
//  AddMetaViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 20/07/21.
//

import Foundation

class AddMetaViewModel: ObservableObject {
    
    var duracao: Int16 = 0
    var frequencia: String = ""
    var valorAtual: Double = 0.0
    var valorMeta: Double = 0.0
    
    
    
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
