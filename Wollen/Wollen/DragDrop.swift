//
//  dragDrop.swift
//  Wollen
//
//  Created by José Henrique Fernandes Silva on 22/07/21.
//

import SwiftUI

struct DragDrop: View {
    
    @State var image: UIImage = UIImage(named: "teste")!
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .frame()
            .aspectRatio(contentMode: .fit)
            .onDrop(of: ["public.image"], delegate: DropImageDelegate(image: $image))
            .onDrag({ NSItemProvider(object: image) })
    }
}

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
                    }
                }
            }
        }
        return true
    }
    
    func validateDrop(info: DropInfo) -> Bool {
        return info.hasItemsConforming(to: ["public.image"])
    }
    
    func dropEntered(info: DropInfo) {
        print("Entrou")
    }
    
    func dropExited(info: DropInfo) {
        print("Saiu")
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        print("Atualizou: \(Date())")
        return DropProposal(operation: DropOperation.copy)
    }
}

struct dragDrop_Previews: PreviewProvider {
    static var previews: some View {
        DragDrop()
    }
}
