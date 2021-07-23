//
//  dragDrop.swift
//  Wollen
//
//  Created by José Henrique Fernandes Silva on 22/07/21.
//

import SwiftUI

struct DragDrop: View {
    
    @State var image: UIImage = UIImage(named: "teste")!
    @State var images: [UIImage] = []
    
    var pub = NotificationCenter.default.publisher(for: Notification.Name("atualiza"))
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .onDrop(of: ["public.image"], delegate: DropImageDelegate(image: $image))
            HStack {
                ForEach(images, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                }.onReceive(pub, perform: { _ in
                    self.images.append(self.image)
                })
            }
        }
    }
    
    func atualiza(image: UIImage) {
        self.images.append(image)
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
                        NotificationCenter.default.post(Notification.init(name: Notification.Name("atualiza")))
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
