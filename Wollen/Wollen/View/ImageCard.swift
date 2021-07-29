//
//  SenderView.swift
//  Wollen
//
//  Created by Palloma Ramos on 20/07/21.
//

import SwiftUI

struct ImageCard : View {
    
    // Core Data - adicionar imagem
    @StateObject private var addMidiaVM = addMidiaViewModel()
    
    // Core Data - recuperar imagens
    @StateObject private var listaMidiaVM = ListaMidiasViewModel()
    
    // Core Data - desejo ao qual as imagens estarão associadas
    //let desejoVM: DesejoViewModel
    
    @State var images: [UIImage] = []
    
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
                        .foregroundColor(.gray)
                        .padding()
                    
                }
                
            }
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(images, id: \.self) { data in
                        
                        //TO DO: recuperar do core data
                        Image(uiImage: data)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 120, height: 89)
                            .cornerRadius(6)
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
            
            // Salvar no core data
            addMidiaVM.imagem = image
            // Aqui está salvando sem associar a um desejo especifico
            addMidiaVM.saveMidia()
            
            // TO DO: Salvar associado a um desejo
            //addMidiaVM.addMidiaToDesejo(desejoId: desejoVM.id)
            
        })
        .sheet(isPresented: self.$show, content: {
            ImagePicker(show: self.$show, image: self.$image)
        })
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
        //let desejoVM = DesejoViewModel(desejo: Desejo (context: CoreDataManager.shared.viewContext))
        //ImageCard(desejoVM: desejoVM)
        ImageCard()
            .previewDevice("iPhone 11")
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}

