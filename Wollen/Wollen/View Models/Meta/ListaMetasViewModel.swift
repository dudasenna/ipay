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
    
    // Atualiza a variável Published meta, com o conteúdo de uma meta associada a um desejo
    func getMetaFromDesejo(desejo: DesejoViewModel) {
        let desejo =  CoreDataManager.shared.getDesejoById(id: desejo.id)
        if let desejo = desejo {
            self.meta = MetaViewModel(meta: desejo.meta!)
        }
    }
    
    func returnMetaFromDesejo(desejo: DesejoViewModel) -> MetaViewModel? {
        let desejo =  CoreDataManager.shared.getDesejoById(id: desejo.id)
        if let desejo = desejo {
            return MetaViewModel(meta: desejo.meta!)
        }
        return nil
    }
    
}
