//
//  AddCategoriaViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 20/07/21.
//

import Foundation

class AddCategoriaViewModel: ObservableObject {
    
    var nome: String = ""
    var cor: String = ""
    
    func saveCategoria() {
        
        let manager = CoreDataManager.shared
        let categoria = Categoria(context: manager.persistentContainer.viewContext)
        categoria.nome = nome
        categoria.cor = cor
        
        manager.save()
        print("Salvou a categoria!")
    }
}
