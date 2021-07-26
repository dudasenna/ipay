//
//  MidiaViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 26/07/21.
//

import Foundation
import CoreData

struct MidiaViewModel {
    
    let midia: Midia
    
    var id: NSManagedObjectID {
        return midia.objectID
    }
    
//    var imagem: Data {
//        //return midia.imagem ?? nil
//    }
    
}
