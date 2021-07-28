//
//  WishGraphCard.swift
//  Wollen
//
//  Created by Eduarda Senna on 26/07/21.
//

import SwiftUI

struct WishGraphCard: View {
    
    var progress: Float
    var savedMoney = 2000.0
    var goalMoney = 2500.0
    
    var body: some View {
        let formattedSavedMoney = String(format: "%.0f", savedMoney)
        let formattedGoalMoney = String(format: "%.0f", goalMoney)
        VStack (alignment: .center, spacing: nil, content: {
            ZStack {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(Color("systemMint"))
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color("systemMint"))
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
                Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                    .font(.custom("Avenir Next", size: 35))
                    .bold()
            }
            .padding(5)
            .frame(minWidth: 0, idealWidth: 150, maxWidth: 150, minHeight: 0, idealHeight: 150, maxHeight: 150, alignment: .center)
            Spacer()
            HStack {
                Text("R$ \(formattedSavedMoney) /")
                    .bold()
                    .font(.custom("Avenir Next", size: 25))
                Text("\(formattedGoalMoney)")
                    .font(.custom("Avenir Next", size: 25))
            }
        })
        .padding(20)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
        .frame(minWidth: 0, idealWidth: 250, maxWidth: 250, minHeight: 0, idealHeight: 250, maxHeight: 250, alignment: .center)
    }
}

struct WishGraphCard_Previews: PreviewProvider {
    static var previews: some View {
        WishGraphCard(progress: 0.8)
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
