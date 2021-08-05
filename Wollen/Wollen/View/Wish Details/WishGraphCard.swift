//
//  WishGraphCard.swift
//  Wollen
//
//  Created by Eduarda Senna on 26/07/21.
//

import SwiftUI

struct WishGraphCard: View {
    
    init(desejoVM: DesejoViewModel) {
        self.desejoVM = desejoVM
        let meta = desejoVM.desejo.meta ?? metaPadrao
    }
    
    @ObservedObject var listaMetasVM = ListaMetasViewModel()
    
    @State private var progress: Double = 0.8
    @State private var savedMoney = 2000.0
    @State private var goalMoney = 2500.0
    
    var desejoVM: DesejoViewModel
    let metaPadrao = Meta(context: CoreDataManager.shared.viewContext)
    let pub = NotificationCenter.default.publisher(for: NSNotification.Name("atualiza_valor_atual"))
    
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
                Text(String(format: "%.0f%%", min(self.progress, 1.0)*100.0))
                    .font(.custom("Avenir Next", size: 30))
//                    .font(.custom("Avenir Next", size: 35))
                    .bold()
            }
            .padding(5)
            .frame(minWidth: 0, idealWidth: 150, maxWidth: 150, minHeight: 0, idealHeight: 150, maxHeight: 150, alignment: .center)
            Spacer()
            HStack {
                let money = Text(LocalizedStringKey("R$"))
                    Text("\(money) \(formattedSavedMoney) /")
                    .bold()
                    .font(.custom("Avenir Next", size: 20))
                Text("\(formattedGoalMoney)")
                    .font(.custom("Avenir Next", size: 20))
            }
        })
        .padding(20)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
        .frame(minWidth: 0, idealWidth: 250, maxWidth: 250, minHeight: 0, idealHeight: 250, maxHeight: 250, alignment: .center)
        .onAppear() {
            self.listaMetasVM.getMetaFromDesejo(desejo: desejoVM)
            self.savedMoney = listaMetasVM.meta!.valorAtual
            self.goalMoney = desejoVM.preco
            self.progress = self.savedMoney / self.goalMoney
        }
        .onReceive(self.pub) { _ in
            self.listaMetasVM.getMetaFromDesejo(desejo: desejoVM)
            self.savedMoney = listaMetasVM.meta!.valorAtual
            self.goalMoney = desejoVM.preco
            self.progress = self.savedMoney / self.goalMoney
        }
    }
}

struct WishGraphCard_Previews: PreviewProvider {
    static var previews: some View {
        let desejo = Desejo()
        let desejoVM = DesejoViewModel(desejo: desejo)
        WishGraphCard(desejoVM: desejoVM)
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
