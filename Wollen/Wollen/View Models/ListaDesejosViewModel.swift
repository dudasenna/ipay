//
//  ListaDesejosViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 19/07/21.
//

import Foundation
import CoreData

class ListaDesejosViewModel: ObservableObject {
    
    @Published var desejos = [DesejoViewModel]()
    
    // Deleta um desejo pelo ObjectID
    func deleteDesejo(desejoSelecionado: DesejoViewModel) {
        let desejo = CoreDataManager.shared.getDesejoById(id: desejoSelecionado.id)
        if let desejo = desejo {
            CoreDataManager.shared.deleteDesejo(desejo)
        }
    }
    
    // Atualiza o conteúdo do array de desejos
    func getAllDesejos() {
        let desejos = CoreDataManager.shared.getAllDesejos()
        DispatchQueue.main.async {
            self.desejos = desejos.map(DesejoViewModel.init)
        }
    }
    
    func getDesejosOfCategoria(categoria: CategoriaViewModel) {
        let categoria = CoreDataManager.shared.getCategoriaById(id: categoria.id)
        if let categoria = categoria {
            DispatchQueue.main.async {
                // Mapeia o array de Desejo (entidade) para um array de DesejoViewModel
                self.desejos = (categoria.desejos?.allObjects as! [Desejo]).map(DesejoViewModel.init)
            }
        }
    }
    
//    func getCategoriaFromDesejo(desejo: DesejoViewModel) {
//        
//    }
    
}

struct DesejoViewModel {
    
    let desejo: Desejo
    
    var id: NSManagedObjectID {
        return desejo.objectID
    }
    
    var nome: String {
        return desejo.nome ?? ""
    }
    
    var descricao: String {
        return desejo.descricao ?? ""
    }
    
    var preco: Double {
        return desejo.preco
    }
    
    var link: String {
        return desejo.link ?? ""
    }
    
}
