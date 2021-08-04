//
//  WishGoalCard.swift
//  Wollen
//
//  Created by Eduarda Senna on 15/07/21.
//

import SwiftUI

struct WishGoalCard: View {
    
    init(desejoVM: DesejoViewModel) {
        self.desejoVM = desejoVM
    }
    
    @ObservedObject var ListaMetasVM = ListaMetasViewModel()
    var desejoVM: DesejoViewModel
    
    var categoryColor = "systemPurple"
    var goalValue = 50.0
    var goalTime = 4
    var goalPeriod = "Semanas"
    var accomplished = false
    
    var body: some View {
        let formattedGoalValue = String(format: "%.2f", goalValue)
        VStack (alignment: .center, spacing: nil, content: {
            HStack {
                Text(LocalizedStringKey("Meta"))
                    .bold()
                    .font(.custom("Avenir Next", size: 22))
                    .padding()
                Spacer()
            }
            // Meta cumprida
            if accomplished {
                Text(LocalizedStringKey("Cumprida"))
                    .bold()
                    .font(.custom("Avenir Next", size: 22))
                    .foregroundColor(Color(categoryColor))
                    .padding(.bottom)
                Text(LocalizedStringKey("Parabéns 🎉\n Você merece!"))
                    .padding(.vertical)
                    .padding(.bottom, 20)
                    .font(.custom("Avenir Next", size: 18))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
            // Meta ainda não cumprida
            else {
                let valorMeta = Text(LocalizedStringKey("R$"))
                    
                Text("\(valorMeta) \(formattedGoalValue) / \(goalPeriod)")
                    
                    
                    .bold()
                    .font(.custom("Avenir Next", size: 22))
                    .foregroundColor(Color("systemMint"))
                    .padding(.bottom)
               let meta = Text(LocalizedStringKey("Se você continuar neste ritmo, você completará a meta daqui a"))
                
                Text("\(meta) \(goalTime) \(goalPeriod).")
                    
                    .padding(.vertical)
                    .font(.custom("Avenir Next", size: 18))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
        })
        .padding(15)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
        .frame(minWidth: 0, idealWidth: 250, maxWidth: 250, minHeight: 0, idealHeight: 250, maxHeight: 250, alignment: .center)
        .onAppear() {
            self.ListaMetasVM.getMetaFromDesejo(desejo: self.desejoVM)
        }
    }
}

struct WishGoalCard_Previews: PreviewProvider {
    static var previews: some View {
        let desejo = Desejo()
        let dejesoVM = DesejoViewModel(desejo: desejo)
        WishGoalCard(desejoVM: dejesoVM)
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
