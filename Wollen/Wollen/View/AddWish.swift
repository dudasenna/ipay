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
            
            (Color.white)
                .ignoresSafeArea(.all)
            
            VStack (spacing: 30) {
                
                HStack (alignment: .top, spacing: 30) {
                    InformationsCard()
                    CategoriesCard()
                }
                
                HStack (alignment: .top, spacing: 30) {
                    ImageCard()
                    GoalCard()
                }
            }
        }.padding(30)
        
    }
}

struct AddWish_Previews: PreviewProvider {
    static var previews: some View {
        AddWish()
    }
}
