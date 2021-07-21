//
//  ListaMetasViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 20/07/21.
//

import Foundation
import CoreData

class ListaMetasViewModel: ObservableObject {
    
    @Published var meta: MetaViewModel?
    
//    func updateMeta(metaSelecionada: MetaViewModel) {
//        let meta = CoreDataManager.shared.getMetaById(id: metaSelecionada.id)
//        if let meta = meta {
//            //CoreDataManager.shared.updateMeta(meta)
//        }
//    }
    
    func getMetaFromDesejo(desejo: DesejoViewModel) {
        let desejo =  CoreDataManager.shared.getDesejoById(id: desejo.id)
        if let desejo = desejo {
            DispatchQueue.main.async {
                self.meta = MetaViewModel(meta: desejo.meta!)
            }
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
