//
//  WishGoalCard.swift
//  Wollen
//
//  Created by Eduarda Senna on 15/07/21.
//

import SwiftUI

struct WishGoalCard: View {
    var goalValue = 50
    var goalTime = 4
    var goalPeriod = "Semanas"
    
    var body: some View {
        VStack (alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            HStack {
                Text("Meta")
                    .bold()
                    .font(.custom("Avenir Next", size: 22))
                    .padding()
                Spacer()
            }
            Text("R$ \(goalValue) / mês")
                .bold()
                .font(.custom("Avenir Next", size: 22))
                .foregroundColor(Color("systemMint"))
                .padding(.bottom)
            Text("Se você continuar neste ritmo, você completará a meta daqui a \(goalTime) \(goalPeriod).")
                .padding()
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
            
        })
        .padding(15)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
        .frame(minWidth: 0, idealWidth: 250, maxWidth: 250, minHeight: 0, idealHeight: 250, maxHeight: 250, alignment: .center)
    }
}

struct WishGoalCard_Previews: PreviewProvider {
    static var previews: some View {
        WishGoalCard()
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
