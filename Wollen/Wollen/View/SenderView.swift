//
//  SenderView.swift
//  Wollen
//
//  Created by Palloma Ramos on 20/07/21.
//

import SwiftUI

struct SenderView : View {

    @State var image: [UIImage] = []
    
    @State var imageaux: UIImage = UIImage()
        
    @State var show = false
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    let pub = NotificationCenter.default.publisher(for: NSNotification.Name("atualiza"))
    
    var body: some View {
        VStack (alignment: .leading){
            HStack{
                Text("Imagens")
                    .bold()
                    .font(.custom("Avenir Next", size: 22))
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        
                    }
                }
                Button(action: {
                    self.show.toggle()
                    print("button touched")
                }) {
                    Image(systemName: "plus.circle")
                        .font(.system(size:24))
                        .foregroundColor(.gray)
                        .padding()
                    
                }
                
            }
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    if self.image.count != 0 {
                        ForEach(image, id: \.self) { data in
                            Image(uiImage: data)
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 120, height: 89)
                                .cornerRadius(6)
                        }
                    }
                    else{
                        CardEmpty()
                    }
                    Spacer(minLength: 10)
                    if image.count < 2 {
                        CardEmpty()
                    }
                    Spacer(minLength: 10)
                    if image.count < 3 {
                        CardEmpty()
                    }
                    
                }
            }
            
        }
        .onDrop(of: ["public.image"], delegate: DropImageDelegate(image: $imageaux))
        
        .sheet(isPresented: self.$show, content:
                {
                    ImagePicker(show: self.$show, image: self.$image)
                })
        
        .padding(15)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
        
        .onReceive(pub, perform: { _ in
                    self.image.append(self.imageaux)})
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
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: DropOperation.copy)
    }
}

struct CardEmpty: View {
    var body: some View {
        Rectangle()
            .frame(width: 120, height: 89, alignment: .leading)
            .foregroundColor(.gray)
    }
}

struct  SenderView_Previews: PreviewProvider {
    static var previews: some View{
        SenderView()
            .previewDevice("iPhone 11")
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
