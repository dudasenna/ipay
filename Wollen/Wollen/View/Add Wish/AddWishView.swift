//
//  AddWish.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 31/07/21.
//

import SwiftUI

struct AddWishView: View {
    var body: some View {
        ZStack {
            (Color(UIColor(named: "branco_bg")!))
                .ignoresSafeArea(.all)
            
            AddWishCards()
        }
        .padding(30)
        .navigationBarHidden(true)
    }
}

struct AddWishView_Previews: PreviewProvider {
    static var previews: some View {
        AddWishView()
    }
}
