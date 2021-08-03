//
//  MidiaViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 26/07/21.
//

import Foundation
import CoreData
import UIKit

struct MidiaViewModel {
    
    let defaultImage = #imageLiteral(resourceName: "teste")
    
    let midia: Midia
    
    var id: NSManagedObjectID {
        return midia.objectID
    }
    
    var imagem: Data {
        return midia.imagem ?? defaultImage.pngData()!
    }
    
}
<<<<<<< HEAD

=======
>>>>>>> b57e4387a3a2abed8092d590727c2a6fddb51299
