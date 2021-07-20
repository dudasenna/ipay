//
//  ListaCategoriasViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 20/07/21.
//

import Foundation
import CoreData

class ListaCategoriasViewModel: ObservableObject {
    
    @Published var categorias = [CategoriaViewModel]()
    
    func deleteCategoria(categoriaSelecionada: CategoriaViewModel) {
        let categoria = CoreDataManager.shared.getCategoriaById(id: categoriaSelecionada.id)
        if let categoria = categoria {
            CoreDataManager.shared.deleteCategoria(categoria)
        }
    }
    
    func getAllCategorias(){
        let categorias = CoreDataManager.shared.getAllCategorias()
        
        DispatchQueue.main.async {
            self.categorias = categorias.map(CategoriaViewModel.init)
        }
    }
}


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
