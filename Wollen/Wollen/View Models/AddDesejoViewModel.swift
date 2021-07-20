//
//  AddDesejoViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 19/07/21.
//

import Foundation
import CoreData

class AddDesejoViewModel: ObservableObject {
    
    var nome: String = ""
    var descricao: String = ""
    var link: String = ""
    var preco: String = ""
    
    func addDesejoToCategoria(categoriaId: NSManagedObjectID) {
        
        let manager = CoreDataManager.shared
        
        let categoria: Categoria? = manager.getCategoriaById(id: categoriaId)
        
        if let categoria = categoria {
            let desejo = Desejo(context: manager.persistentContainer.viewContext)
            desejo.nome = nome
            desejo.descricao = descricao
            desejo.link = link
            desejo.preco = Double(preco) ?? 0.0
            desejo.categoria = categoria
            
            manager.save()
            print("Salvou o desejo!")
            
        }
        
        
    }
    
    func saveDesejo() {
        
        let manager = CoreDataManager.shared
        let desejo = Desejo(context: manager.persistentContainer.viewContext)
        desejo.nome = nome
        desejo.descricao = descricao
        desejo.link = link
        desejo.preco = Double(preco) ?? 0.0
        
        manager.save()
        print("Botao save desejo")
    }
    
}
