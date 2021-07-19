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
                        .font(.custom("Avenir", size: 22).bold())
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                    Spacer()
                }
                
                // Imagens:
                ScrollView {
                    VStack (alignment: .center) {
                        ForEach(1..<7) {
                            Image("image\($0)")
                                .resizable()
                                .cornerRadius(10)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width*0.8)
                                .padding()
                                .shadow(color: Color.gray.opacity(0.4), radius: 5)
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

struct GalleryCard_Previews: PreviewProvider {
    static var previews: some View {
        GalleryCard()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
