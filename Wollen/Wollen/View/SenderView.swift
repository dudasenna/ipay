//
//  SenderView.swift
//  Wollen
//
//  Created by Palloma Ramos on 20/07/21.
//

import SwiftUI

struct SenderView : View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var image: Data = .init(count: 0)
    
    
    @State var show = false
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    var card = Image.self
    
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
                        Image(uiImage: UIImage(data: self.image)!)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 120, height: 89)
                            .cornerRadius(6) }
                    else{
                        CardEmpty()
                    }
                    Spacer(minLength: 10)
                        CardEmpty()
                    Spacer(minLength: 10)
                    CardEmpty()
                    
//            if self.image.count != 0 {
////           card =
//            Image(uiImage: UIImage(data: self.image)!)
//                .renderingMode(.original)
//                .resizable()
//                .frame(width: 120, height: 89)
//            .cornerRadius(6)
//        }
//            else{
////                Image(systemName: "photo")
////                    .font(.system(size:31))
////                    .foregroundColor(.green)
////               Rectangle()
////                .frame(width: 120, height: 89, alignment: .leading)
////                    .foregroundColor(.gray)
////            card = Image(uiImage: UIImage(named: "teste")!)
//
//            }
                }
            }
            
        }
            
        .sheet(isPresented: self.$show, content:
                {
                    ImagePicker(show: self.$show, image: self.$image)
                })
        
        .padding(15)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
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
