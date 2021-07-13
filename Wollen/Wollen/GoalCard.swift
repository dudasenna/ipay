//
//  GoalCard.swift
//  Wollen
//
//  Created by José Henrique Fernandes Silva on 12/07/21.
//

import SwiftUI

struct GoalCard: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .cyan
    }
    
    @State private var goalBy: GoalBy = .value
    @State private var frequency: FrequencyTypes = .weekly
    @State private var valueTextField = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Meta")
                .font(.body)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding()
            
            
            Picker( selection: $goalBy, label: Text("Que tipo de meta você prefere?")) {
                // Link para tutorial:
                //https://www.youtube.com/watch?v=iqKmgs_0VPE
                ForEach(GoalBy.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            HStack {
                Text("Frequência")
                
                Picker(selection: $frequency, label: Text("Qual a frequência que você deseja guardar dinheiro")) {
                    ForEach(FrequencyTypes.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
            } // HStack
            .padding()
            
            HStack {
                if goalBy == GoalBy.value {
                    Text("Valor")
                    
                    TextField("R$ 4,00", text: $valueTextField)
                        .background(Color(red: 0.933, green: 0.933, blue: 0.938))
                        .cornerRadius(6)
                        .multilineTextAlignment(.center)
                    
                } else {
                    Text("Duração")
                    
                    // Picker duplo
                }
            } // HStack
        } // VStack
    } // body
}

enum GoalBy: String, CaseIterable {
    case value = "Por valor"
    case period = "Por período"
}

enum FrequencyTypes: String, CaseIterable{
    case weekly = "semanal";
    case monthly = "mensal";
}

struct GoalCard_Previews: PreviewProvider {
    static var previews: some View {
        GoalCard()
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
