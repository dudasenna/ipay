//
//  CardSaveMoney.swift
//  Wollen
//
//  Created by José Henrique Fernandes Silva on 13/07/21.
//

import SwiftUI

struct CardSaveMoney: View {
    
    @State private var valueTextField: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Guardar dinheiro")
                .font(.title)
            
            Text("Quanto você gostaria de guardar?")
                .font(.body)
                .padding(.bottom)
            
            HStack {
                Spacer()
                
                TextField("R$ 100,00", text: $valueTextField)
                    .multilineTextAlignment(.center)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Salvar")
                        .foregroundColor(.black)
                })
                .padding(.horizontal)
                .background(Color(UIColor.cyan))
                .cornerRadius(5)
                
            }
        }
        .padding(15)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .fixedSize(horizontal: false, vertical: false)
    }
}

struct CardSaveMoney_Previews: PreviewProvider {
    static var previews: some View {
        CardSaveMoney().previewLayout(.sizeThatFits)
    }
}
