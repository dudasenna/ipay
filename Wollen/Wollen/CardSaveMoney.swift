//
//  CardSaveMoney.swift
//  Wollen
//
//  Created by José Henrique Fernandes Silva on 13/07/21.
//

import SwiftUI
import Combine

struct CardSaveMoney: View {
    
    @State private var valueTextField: String = "R$ 100,00"
    var maxWidth = UIScreen().bounds.width
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Guardar dinheiro")
                .font(.custom("Avenir", size: 22).bold())
            
            Text("Quanto você gostaria de guardar?")
                .font(.custom("Avenir", size: 18))
                .padding(.bottom)
            
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
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Salvar")
                        .foregroundColor(Color(UIColor.darkGray))
                        .font(.custom("Avenir", size: 18).bold())
                        .padding(.horizontal)
                })
                .background(RoundedRectangle(cornerRadius: 5))
                .foregroundColor(Color(UIColor.cyan))
                
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
        CardSaveMoney().previewLayout(.sizeThatFits)
    }
}
