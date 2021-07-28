//
//  CardSaveMoney.swift
//  Wollen
//
//  Created by José Henrique Fernandes Silva on 13/07/21.
//

import SwiftUI
import Combine

struct CardSaveMoney: View {
    
    init(goal value: Float) {
        self.goalValue = value
        self.valueTextField = String("R$ \(value)")
    }
    
    var goalValue: Float = 0
    @State private var valueTextField: String
    var maxWidth = UIScreen().bounds.width
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(LocalizedStringKey("Guardar dinheiro"))
                .font(.custom("Avenir", size: 22).bold())
            
            Text(LocalizedStringKey("Quanto você gostaria de guardar?"))
                .font(.custom("Avenir", size: 18))
                .padding(.vertical)
            
            HStack(alignment: .center) {
                Spacer()
                
                TextField(String(valueTextField), text: $valueTextField)
                    .foregroundColor(.gray)
                    .font(.body)
                    .padding(.horizontal)
                    .multilineTextAlignment(.leading)
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.gray), lineWidth: 1))
                    .frame(minWidth: 0, idealWidth: 200, maxWidth: maxWidth/3, alignment: .trailing)
                    .keyboardType(.numberPad)
                    .onReceive(Just(valueTextField)) { newValue in
                        let filtered = newValue.filter { "0123456789.,".contains($0) }
                        if filtered != newValue {
                            self.valueTextField = String("R$ \(filtered)")
                        }
                    }
                
                Button(
                    action: {
                        // TODO: Salvar valor do TextField no core data
                        
                        // A ideia aqui vai ser colocar o valor da meta
                        self.valueTextField = String("R$ \(self.goalValue)")
                    },
                    label: {
                        Text(LocalizedStringKey("Salvar"))
                            .foregroundColor(Color(UIColor.darkGray))
                            .font(.custom("Avenir", size: 18).bold())
                            .padding(.horizontal)
                    }
                )
                .background(RoundedRectangle(cornerRadius: 5))
                .foregroundColor(Color(UIColor(named: "systemMint")!))
                
                Spacer()
            }
        }
        .padding(15)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .fixedSize(horizontal: false, vertical: false)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
    }
}

struct CardSaveMoney_Previews: PreviewProvider {
    static var previews: some View {
        CardSaveMoney(goal: 50).previewLayout(.sizeThatFits)
    }
}
