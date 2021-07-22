//
//  ContentViewImage.swift
//  Wollen
//
//  Created by Palloma Ramos on 20/07/21.
//

import SwiftUI

struct ContentViewImage: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Desejo.imagens, ascending: true)],
        animation: .default)
    private var imagens: FetchedResults<Desejo>
    
    @State var image: Data = .init(count: 0)
    
    @State var show = false
    
    var body: some View {
        NavigationView{
            List(imagens, id: \.self) { save in
                HStack{
                    if self.image.count != 0{
                        Button(action: {
                            self.show.toggle()
                        }){
                            Image(uiImage: UIImage(data: save.imagens ?? self.image)!)
                        }
                    }
                    else {
                        Button(action: {
                            self.show.toggle()
                            let send = Desejo(context: self.viewContext)
                            send.imagens = self.image
                        }) {
                            Image(systemName: "plus.circle")
                        }
                    }
                }
            }
        }
    }
}

struct ContentViewImage_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewImage()
    }
}
