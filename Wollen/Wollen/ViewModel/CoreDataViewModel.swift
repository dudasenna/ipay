//
//  CoreDataViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 15/07/21.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    
    @Published var categorias: [Categoria] = []
    
    init() {
        lerCategorias()
    }
    
    // MARK: Create
    func addCategoria(nome:String, cor:String) {
        let novaCategoria = Categoria(context: manager.context)
        novaCategoria.nome = nome
        novaCategoria.cor = cor
        save()
    }
    
    // MARK: Read
    func lerCategorias() {
        let request = NSFetchRequest<Categoria>(entityName: "Categoria")
        do {
            categorias = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    // MARK: Update
    func atualizarCategoria(entity: Categoria, novoNome: String, novaCor: String) {
        let novoNome = novoNome
        entity.nome = novoNome
        
        let novaCor = novaCor
        entity.cor = novaCor
        
        save()
    }
    
    // MARK: Delete
    // TO DO: Precisamos ver como será feito na interface
    func deletarCategoria(entity: Categoria) {
        manager.context.delete(entity)
        save()
    }
    
    
    func save() {
        //Recarregar os dados
        categorias.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.manager.save()
            self.lerCategorias()
        }
    }
}
