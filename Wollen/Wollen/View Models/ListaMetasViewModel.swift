//
//  ListaMetasViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 20/07/21.
//

import Foundation
import CoreData

class ListaMetasViewModel: ObservableObject {
    
    //@Published var metas = [MetaViewModel]()
    
    func updateMeta(metaSelecionada: MetaViewModel) {
        let meta = CoreDataManager.shared.getMetaById(id: metaSelecionada.id)
        if let meta = meta {
            //CoreDataManager.shared.updateMeta(meta)
        }
    }
    
}

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
    
}
