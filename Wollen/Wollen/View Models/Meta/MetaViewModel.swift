//
//  MetaViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 23/07/21.
//

import Foundation
import CoreData

struct MetaViewModel {
    
    let meta: Meta
    
    var id: NSManagedObjectID {
        return meta.objectID
    }
    
    var duracao: Int16 {
        return meta.duracao
    }
    
    var frequencia: String {
        return meta.frequencia ?? ""
    }
    
    var valorAtual: Double {
        return meta.valorAtual
    }
    
    var valorMeta: Double {
        return meta.valorMeta
    }
    
    var progresso: Double {
        if meta.valorMeta != 0.0 {
            return meta.valorAtual / meta.valorMeta
        }
        return 0.0
    }
    
}
