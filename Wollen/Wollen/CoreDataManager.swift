//
//  CoreDataManager.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 19/07/21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "WollenDataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to initialize Core Data \(error)")
            }
        }
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    
    // MARK: Desejo

    func getAllDesejos() -> [Desejo] {
        
        let fetchRequest: NSFetchRequest<Desejo> = Desejo.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
    }
    
    func getDesejoById(id: NSManagedObjectID) -> Desejo? {
        
        do {
            return try persistentContainer.viewContext.existingObject(with: id) as? Desejo
        } catch {
            print(error)
            return nil
        }
        
    }
    
    
    func deleteDesejo(_ desejo: Desejo) {
        
        persistentContainer.viewContext.delete(desejo)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to delete Desejo \(error)")
        }
        
    }
    
    // MARK: Categoria
    
    func getAllCategorias() -> [Categoria] {
        
        let fetchRequest: NSFetchRequest<Categoria> = Categoria.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
    }
    
    func getCategoriaById(id: NSManagedObjectID) -> Categoria? {
        
        do {
            return try persistentContainer.viewContext.existingObject(with: id) as? Categoria
        } catch {
            print(error)
            return nil
        }
        
    }
    
    
    func deleteCategoria(_ categoria: Categoria) {
        
        persistentContainer.viewContext.delete(categoria)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to delete categoria \(error)")
        }
        
    }
    
    // MARK: Meta
    
    func getAllMetas() -> [Meta] {
        
        let fetchRequest: NSFetchRequest<Meta> = Meta.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
    }
    
    func getMetaById(id: NSManagedObjectID) -> Meta? {
        
        do {
            return try persistentContainer.viewContext.existingObject(with: id) as? Meta
        } catch {
            print(error)
            return nil
        }
        
    }
    
    
    func deleteMeta(_ meta: Meta) {
        
        persistentContainer.viewContext.delete(meta)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to delete Meta \(error)")
        }
        
    }
    
    
    func save() {
        do {
            try persistentContainer.viewContext.save()
            print("Salvou!")
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save an entity \(error)")
        }
    }
}
    
