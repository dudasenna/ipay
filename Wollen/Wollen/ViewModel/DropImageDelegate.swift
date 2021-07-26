//
//  DropImageDelegate.swift
//  Wollen
//
//  Created by José Henrique Fernandes Silva on 23/07/21.
//

import Foundation
import SwiftUI

struct DropImageDelegate: DropDelegate {
    
    @Binding var image: UIImage
    
    // Método responsável por tratar os dados:
    func performDrop(info: DropInfo) -> Bool {
        let itens = info.itemProviders(for: ["public.image"])
        for item in itens {
            // Carregar a imagem:
            item.loadObject(ofClass: UIImage.self) { image, error in
                guard error == nil else {
                    print("Erro ao carregar imagem")
                    return
                }
                if let image = image {
                    DispatchQueue.main.async {
                        self.image = image as! UIImage
                        // Manda uma notificação para o ImageCard
                        NotificationCenter.default.post(Notification.init(name: Notification.Name("atualiza_array_images")))
                    }
                }
            }
        }
        return true
    }
    
    func validateDrop(info: DropInfo) -> Bool {
        return info.hasItemsConforming(to: ["public.image"])
    }
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: DropOperation.copy)
    }
}
