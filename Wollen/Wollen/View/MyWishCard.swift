//
//  MyWishCard.swift
//  Wollen
//
//  Created by Eduarda Senna on 13/07/21.
//

import SwiftUI

struct MyWishCard: View {
    
    @State private var downloadAmount = 10.0
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            Image(uiImage: UIImage(named: "teste")!)
                .resizable()
                .frame(minWidth: 0, idealWidth: 220, maxWidth: 220, minHeight: 0, idealHeight: 130, maxHeight: 130, alignment: .center)
                .scaledToFit()
                .cornerRadius(10)
            Text("Nome")
                .font(.custom("Avenir", size: 16))
            ProgressView(value: downloadAmount, total: 100)
                .frame(minWidth: 0, idealWidth: 180, maxWidth: 180, minHeight: 0, idealHeight: 0, maxHeight: 0, alignment: .center)
                .scaleEffect(x: 1, y: 4, anchor: .center)
                .padding()

        })
        .padding(5)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
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
