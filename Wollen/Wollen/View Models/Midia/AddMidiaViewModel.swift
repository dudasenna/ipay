//
//  AddMidiaViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 26/07/21.
//

import Foundation
import CoreData
import UIKit

class addMidiaViewModel: ObservableObject {
    
    var imagem = UIImage()
    
    
    func saveMidia() {
        let manager = CoreDataManager.shared
        let midia = Midia(context: manager.persistentContainer.viewContext)
        
        // Para salvar a imagem em Core Data, precisa converter para PNGData
        let dadosImagem = imagem.pngData()

        // Pode converter para jpeg e comprimir para diminuir o espaço utilizado. compressionQuality = 0 -> maior compressão
        //let dadosImagem = imagem.jpegData(compressionQuality: 0.5)
        midia.imagem = dadosImagem
        
        manager.save()
        print("Salvou a imagem!")
        
    }
    
    // Cria uma midia associada a um Desejo já existente
    func addMidiaToDesejo(desejoId: NSManagedObjectID) {
        
        let manager = CoreDataManager.shared
        
        let desejo: Desejo? = manager.getDesejoById(id: desejoId)
        
        if let desejo = desejo {
            let midia = Midia(context: manager.persistentContainer.viewContext)
            
            // Para salvar a imagem em Core Data, precisa converter para PNGData
            let dadosImagem = imagem.pngData()
            
            // Pode converter para jpeg e comprimir para diminuir o espaço utilizado. compressionQuality = 0 -> maior compressão
            //let dadosImagem = imagem.jpegData(compressionQuality: 0.5)
            midia.imagem = dadosImagem

            desejo.addToImagens(midia)
            
            manager.save()
            print("Salvou a midia!")
            
        }

    }
}
