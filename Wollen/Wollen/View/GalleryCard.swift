//
//  GalleryCard.swift
//  Wollen
//
//  Created by José Henrique Fernandes Silva on 19/07/21.
//

import SwiftUI

struct GalleryCard: View {
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Título:
                HStack {
                    Text("Galeria")
                        .font(.custom("Avenir Next", size: 22).bold())
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading])
                    Spacer()
                }
                
                // Imagens:
                ScrollView {
                    VStack (alignment: .center) {
                        ForEach(1..<7) { _ in
                            imageFromDatabase(width: geometry.size.width)
                        }
                    }
                }.padding()
            }
            .background(Color(red: 248/256, green: 248/256, blue: 248/256))
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.4), radius: 5)
        }
        
    }
}

fileprivate func imageFromDatabase(width: CGFloat) -> some View {
    let image = Image("teste")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width*0.8)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            .shadow(color: Color.gray.opacity(0.4), radius: 5)
    return image
}

struct GalleryCard_Previews: PreviewProvider {
    static var previews: some View {
        GalleryCard()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
