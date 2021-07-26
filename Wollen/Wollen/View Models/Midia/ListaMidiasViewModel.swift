//
//  ListaMidiasViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 26/07/21.
//

import Foundation
import CoreData

class ListaMidiasViewModel: ObservableObject {
    
    @Published var midias = [MidiaViewModel]()
    
    func deleteMidia(midiaSelecionada: MidiaViewModel) {
        
        let midia = CoreDataManager.shared.getMidiaById(id: midiaSelecionada.id)
        if let midia = midia {
            CoreDataManager.shared.deleteMidia(midia)
        }
    }
    
    func getMidiasFromDesejo(desejo: DesejoViewModel) {
        
        let desejo = CoreDataManager.shared.getDesejoById(id: desejo.id)
        if let desejo = desejo {
            DispatchQueue.main.async {
                self.midias = (desejo.imagens?.allObjects as! [Midia]).map(MidiaViewModel.init)
            }
        }
        
    }
    
}
