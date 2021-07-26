//
//  SenderView.swift
//  Wollen
//
//  Created by Palloma Ramos on 20/07/21.
//

import SwiftUI

struct ImageCard : View {
    
    @State public var images: [UIImage] = []
    
    @State var image: UIImage = UIImage()
    
    @State var show = false
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    let pub = NotificationCenter.default.publisher(for: NSNotification.Name("atualiza_array_images"))
    
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
                }) {
                    Image(systemName: "plus.circle")
                        .font(.system(size:24))
                        .foregroundColor(Color("preto_primario"))
                        .padding()
                    
                }
                
            }
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(0..<(self.images.count), id: \.self) { index in
                        ImageView(image: images[index], index: index)
                    }
                    // Adiciona cards vazios se tiver menos que três imagens:
                    if self.images.count < 3 {
                        ForEach(0..<(3 - self.images.count), id: \.self) {_ in
                            CardEmpty()
                        }
                    }
                }
            }
        }
        .padding(15)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
        .onDrop(of: ["public.image"], delegate: DropImageDelegate(image: $image))
        .onReceive(pub, perform: { _ in
            self.images.append(self.image)
        })
        .sheet(isPresented: self.$show, content: {
            ImagePicker(show: self.$show, image: self.$images)
        })
    }
    
    func ImageView(image: UIImage, index: Int) -> some View {
        var view: some View {
            ZStack {
                Image(uiImage: image)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 120, height: 89)
                    .cornerRadius(6)
                
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            deleteImage(index)
                        },
                        label: {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(Color(red: 248/256, green: 248/256, blue: 248/256))
                        })
                        .background(Color("preto_primario"))
                        .cornerRadius(20)
                        .padding(5)
                        .shadow(color: Color.gray.opacity(0.4), radius: 5)
                    }.frame(width: 120)
                    Spacer()
                }.frame(width: 120, height: 89)
            }
        }
        
        return view
    }
    
    func deleteImage(_ index: Int) -> Void {
        self.images.remove(at: index)
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
        ImageCard()
            .previewDevice("iPhone 11")
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
