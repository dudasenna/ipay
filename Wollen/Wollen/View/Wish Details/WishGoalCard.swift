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
    var goalType = "Por valor"
    var actualValue = 0.0
    var price = 200.0
    @State private var goalValue = 50.0
    @State private var accomplished = false
    @State private var timeToText = ""
    @State private var periodToText = Text("")
    @State private var limitDate = ""
    @State private var textoMetaPorPeriodo = Text("")
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

                if self.goalType == "Por valor" {
                    
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
                else {
                    
                    self.textoMetaPorPeriodo
                        .bold()
                        .font(.custom("Avenir Next", size: 22))
                        .foregroundColor(Color("systemMint"))
                        //.padding(.bottom)
                    
                    //ScrollView(.vertical) {
                        let meta = Text(LocalizedStringKey("Para você conseguir completar a meta até "))
                        Text("\(meta) \(self.limitDate).")
                            .padding(.vertical)
                            .font(.custom("Avenir Next", size: 18))
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                    //}
                }
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
            self.limitDate = getLimitDate()
            if self.listaMetasVM.meta!.tipo == "Por período" {
                self.getValuePerFrequency()
            }
        }
        .onReceive(self.pub) { _ in
            listaMetasVM.getMetaFromDesejo(desejo: desejoVM)
            timeToFinishGoal()
            convertGoalPeriod()
            if self.listaMetasVM.meta!.tipo == "Por período" {
                self.getValuePerFrequency()
            }
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
    
    func getLimitDate() -> String {
        let meta = self.listaMetasVM.meta!
        var seconds: Double = 0
        
        if meta.duracao2 == "semanas" {
            seconds = WeeksToSeconds(Double(meta.duracao))
        } else if meta.duracao2 == "meses" {
            seconds = MonthsToSeconds(Double(meta.duracao))
        } else { // anos
            seconds = YearsToSeconds(Double(meta.duracao))
        }
        
        var limitDate = Date()
        limitDate.addTimeInterval(TimeInterval(seconds))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: limitDate)
        
        return dateString
    }
    
    func getLimitDate() -> Date {
        let meta = self.listaMetasVM.meta!
        var seconds: Double = 0
        
        if meta.duracao2 == "semanas" {
            seconds = WeeksToSeconds(Double(meta.duracao))
        } else if meta.duracao2 == "meses" {
            seconds = MonthsToSeconds(Double(meta.duracao))
        } else { // anos
            seconds = YearsToSeconds(Double(meta.duracao))
        }
        
        var limitDate = Date()
        limitDate.addTimeInterval(TimeInterval(seconds))
        
        return limitDate
    }
    
    func getValuePerFrequency() -> String {
        // Aqui vai retornar quanto o usuário tem que economizar
        // vai precisar usar a data limite, valor atual e alor da meta
        // além da frequência
        
        let meta = self.listaMetasVM.meta!
        
        var durationWeeks: Double = Double(meta.duracao)
        
        let currentDate: Date = Date()
        let limitDate: Date = getLimitDate()
        
        //durationWeeks = limitDate - currentDate
        let distanceSeconds = currentDate.distance(to: limitDate)
        let distanceWeeks = distanceSeconds / 604800
        durationWeeks = distanceWeeks
        
        let goalValuePerWeek = (self.desejoVM.desejo.preco - meta.valorAtual) / durationWeeks
        
        var perString = ""
        
        if meta.frequencia == "semanal" {
            self.goalValue = goalValuePerWeek
            perString = "por semana"
        } else {
            // Valor da meta por mês
            self.goalValue = goalValuePerWeek * 4
            perString = "por mês"
        }
        
        print("R$ \(String(format: "%.2f", goalValue))\n\(perString)")
        
        // Atualiza variavel que mostra o texto
        self.textoMetaPorPeriodo = Text("R$ \(String(format: "%.2f", goalValue))\n\(perString)")
        
        return "R$ \(String(format: "%.2f", goalValue))\n\(perString)"
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
