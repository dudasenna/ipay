//
//  AddWish.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 31/07/21.
//

import SwiftUI

struct AddWish: View {
    var body: some View {
        ZStack {
            (Color(UIColor(named: "branco_bg")!))
                .ignoresSafeArea(.all)
            
            AddWishCards()
        }
        //.navigationBarHidden(true)
    }
}

struct AddWish_Previews: PreviewProvider {
    static var previews: some View {
        AddWish()
    }
}
