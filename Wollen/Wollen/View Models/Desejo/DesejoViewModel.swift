//
//  DesejoViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 23/07/21.
//

import Foundation
import CoreData

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
    
    // Retorna a MidiaViewModel da primeira imagem associada ao desejo
    //TO DO tratar o caso de não ter nenhuma imagem
    var midiaVM: MidiaViewModel {
        let midias = desejo.imagens!.allObjects as! [Midia]
        return MidiaViewModel(midia: midias[0])
    }
    
    var categoriaVM: CategoriaViewModel {
        return CategoriaViewModel(categoria: desejo.categoria ?? Categoria())
    }
    
}
