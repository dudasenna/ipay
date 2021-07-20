//
//  AddDesejoViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 19/07/21.
//

import Foundation

class AddDesejoViewModel: ObservableObject {
    
    var nome: String = ""
    var descricao: String = ""
    var link: String = ""
    var preco: Double = 0.0
    
    func saveDesejo() {
        
        let manager = CoreDataManager.shared
        let desejo = Desejo(context: manager.persistentContainer.viewContext)
        desejo.nome = nome
        desejo.descricao = descricao
        desejo.link = link
        desejo.preco = preco
        
        manager.save()
        print("Botao save desejo")
    }
    
}
