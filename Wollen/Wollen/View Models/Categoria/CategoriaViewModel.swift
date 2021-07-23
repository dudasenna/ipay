//
//  CategoriaViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 23/07/21.
//

import Foundation
import CoreData

struct CategoriaViewModel {
    
    let categoria: Categoria
    
    var id: NSManagedObjectID {
        return categoria.objectID
    }
    
    var nome: String {
        return categoria.nome ?? ""
    }
    
    var cor: String {
        return categoria.cor ?? ""
    }
}
