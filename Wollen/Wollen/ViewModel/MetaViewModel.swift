//
//  MetaViewModel.swift
//  Wollen
//
//  Created by Palloma Ramos on 15/07/21.
//

import Foundation
import CoreData

class MetaViewModel: ObservableObject{
    static let shared = MetaViewModel()
    
    let metaManager = CoreDataManager.instance
    
    @Published var metas: [Meta] = []
    
    init() {
    }
    
    // MARK: Create
    
    func addMeta(duracaoMeta: Int16, frequencia: String, valorAtual: Double, valorMeta: Double) {
        let novaMeta = Meta(context: metaManager.context)
        novaMeta.duracaoMeta = duracaoMeta
        novaMeta.frequencia = frequencia
        novaMeta.valorAtual = valorAtual
        novaMeta.valorMeta = valorMeta
        save()
    }
    
    // MARK: Read
    func lerMetas() {
        let request = NSFetchRequest<Meta>(entityName: "Meta")
        do {
            metas = try metaManager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    // MARK: Update
    func atualizarMeta(entity: Meta, novaDuracao: Int16, novaFrequencia: String, novoValorAtual:Double, novoValorMeta: Double) {
        let novaDuracao = novaDuracao
        entity.duracaoMeta = novaDuracao
        
        let novaFrequencia = novaFrequencia
        entity.frequencia = novaFrequencia
        
        let novoValorAtual = novoValorAtual
        entity.valorAtual = novoValorAtual
        
        let novoValorMeta = novoValorMeta
        entity.valorMeta = novoValorMeta
        
        save()
    }
    
    // MARK: Delete
    // TO DO: Precisamos ver como será feito na interface
    func deletarMeta(entity: Meta) {
        metaManager.context.delete(entity)
        save()
    }
    
    func save() {
        //Recarregar os dados
        metas.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.metaManager.save()
            self.lerMetas()
        }
}
}
