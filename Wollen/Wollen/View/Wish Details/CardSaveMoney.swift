//
//  CardSaveMoney.swift
//  Wollen
//
//  Created by José Henrique Fernandes Silva on 13/07/21.
//

import SwiftUI
import Combine

struct CardSaveMoney: View {

    // init(goal value: Float, desejo: DesejoViewModel) {
    //     self.goalValue = value
    //     self.valueTextField = String("R$ \(value)")
    //     self.desejoVM = desejo
    // }

    init(goal value: Float, desejo: DesejoViewModel) {
        self.goalValue = value
        //self.valueTextField = String("R$ \(value)")
        let textAux = NSLocalizedString("R$", comment: "")
        self.valueTextField = ("\(textAux) \(value)")
        self.desejoVM = desejo
    }

    @StateObject private var updateDesejoVM = UpdateDesejoViewModel()
    @StateObject private var listaMetasVM = ListaMetasViewModel()
    @State private var valueTextField: String
    @State private var showPopup: Bool = false
    @State private var showSheet = false
    @State private var valuePlaceholder = "R$ 50.0"
    var goalValue: Float = 0
    var maxWidth = UIScreen().bounds.width
    let desejoVM: DesejoViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(LocalizedStringKey("Guardar dinheiro"))
                .bold()
                .font(.custom("Avenir Next", size: 22))
            
            Text(LocalizedStringKey("Quanto você gostaria de guardar?"))
                .font(.custom("Avenir", size: 18))
                .padding(.vertical)
            
            HStack(alignment: .center) {
                Spacer()
                
                // Text field:
                TextField(String(valuePlaceholder), text: $valuePlaceholder)
                    .foregroundColor(.gray)
                    .font(.body)
                    .padding(.horizontal)
                    .multilineTextAlignment(.leading)
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.gray), lineWidth: 1))
                    .frame(minWidth: 0, idealWidth: 200, alignment: .trailing)
                    .keyboardType(.numberPad)
                    .onReceive(Just(valuePlaceholder)) { newValue in
                        let filtered = valueFiltering(newValue)
                        if filtered != newValue {
                            self.valueTextField = String("\(filtered)")
                            self.valuePlaceholder = "R$ \(self.valueTextField)"
                        }
                    }
                
                // Botão salvar
                Button("Salvar") {
                    withAnimation {
                        self.showPopup.toggle()
                    }
                }
                .foregroundColor(Color(UIColor(named: "preto_primario")!))
                            .font(.custom("Avenir Next", size: 18).bold())
                .padding(.horizontal)
                .background(RoundedRectangle(cornerRadius: 5))
                .foregroundColor(Color(UIColor(named: "systemMint")!))
                .alert(isPresented: $showPopup) {
                    Alert(
                        title: Text(LocalizedStringKey("Deseja salvar este valor?")),
                        message: Text("\nR$ \(self.valueTextField)"),
                        primaryButton: .cancel(Text(LocalizedStringKey("Cancelar"))),
                        secondaryButton: .default(
                            Text(LocalizedStringKey("Confirmar")),
                            action: {
                                self.updateDesejoVM.updateValorAtual(desejo: desejoVM, valor: valueTextField)
                                self.valueTextField = String("R$ \(self.goalValue)")
                                // TODO: Atualizar valor do desejo atual nas informações sobre a meta
                                NotificationCenter.default.post(Notification.init(name: Notification.Name("atualiza_valor_atual")))
                            }
                        )
                    )
                }
                
                Spacer()
            }
        }
        .padding(15)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .fixedSize(horizontal: false, vertical: false)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
    }
    
    /// Função responsável por filtar o valor do text field
    func valueFiltering(_ value: String) -> String {
        var filtered = value.filter { "0123456789.".contains($0) }
        let points = filtered.filter { ".".contains($0) }
        if points.count > 1 {
            filtered.removeLast()
        }
        return filtered
    }
}

struct CardSaveMoney_Previews: PreviewProvider {
    static var previews: some View {
        let desejoVM = DesejoViewModel(desejo: Desejo(context: CoreDataManager.shared.viewContext))
        CardSaveMoney(goal: 50, desejo: desejoVM).previewLayout(.sizeThatFits)
    }
}
