//
//  MyWishCard.swift
//  Wollen
//
//  Created by Eduarda Senna on 13/07/21.
//

import SwiftUI

struct MyWishCard: View {
    // de 0.0 a 1.0
    @State private var downloadAmount: Float = 0.7
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            Image(uiImage: UIImage(named: "teste")!)
                .resizable()
                .frame(minWidth: 0, idealWidth: 220, maxWidth: 220, minHeight: 0, idealHeight: 130, maxHeight: 130, alignment: .center)
                .scaledToFit()
                .cornerRadius(10)
            Text("Nome")
                .font(.custom("Avenir", size: 16))
            ProgressBar(value: $downloadAmount).frame(minWidth: 0, idealWidth: 220, maxWidth: 220, minHeight: 0, idealHeight: 20, maxHeight: 20, alignment: .center)
                .padding(.bottom, 5)

        })
        .padding(10)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
//        .shadow(radius: 5)
    }
}

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack (alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(Color(UIColor.systemBlue))
                    .cornerRadius(10)
            }.cornerRadius(45.0)
        }
    }
}

struct MyWishCard_Previews: PreviewProvider {
    static var previews: some View {
        MyWishCard()
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
