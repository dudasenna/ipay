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
        let meta = desejoVM.desejo.meta!
        self.goalValue = meta.valorMeta
        self.actualValue = meta.valorAtual
        self.goalType = meta.tipo!
        self.price = desejoVM.desejo.preco
        self.goalPeriod = meta.frequencia!
        self.timeToFinishGoal()
        self.convertGoalPeriod()
        //self.listaMetasVM.getMetaFromDesejo(desejo: desejoVM)
        
    }
    
    @ObservedObject var listaMetasVM = ListaMetasViewModel()
    var desejoVM: DesejoViewModel
    
    var categoryColor = "systemMint"
    var goalTime = 4
    var goalPeriod = "semanas"
    var goalValue = 50.0
    var goalType = "Por valor"
    var actualValue = 0.0
    var price = 200.0
    @State private var accomplished = false
    @State private var timeToText = ""
    @State private var periodToText = Text("")
    let pub = NotificationCenter.default.publisher(for: NSNotification.Name("atualiza_valor_atual"))
    
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
                Text("\(meta) \(timeToText) \(periodToText).")
                    
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
            self.listaMetasVM.getMetaFromDesejo(desejo: self.desejoVM)
            timeToFinishGoal()
            convertGoalPeriod()
        }
        .onReceive(self.pub) { _ in
            listaMetasVM.getMetaFromDesejo(desejo: desejoVM)
            timeToFinishGoal()
            convertGoalPeriod()
        }
    }
    
    func timeToFinishGoal() {
        let time = self.price / self.actualValue
        if time < 1 {
            self.accomplished = true
        }
        self.timeToText = String(format: "%.0f", time)
        //self.timeToText = "\(time)"
    }
    
    func convertGoalPeriod() {
        var period = "semanas"
        if self.goalPeriod == "mensal" {
            period = "meses"
        }
        self.periodToText = Text(LocalizedStringKey(period))
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
