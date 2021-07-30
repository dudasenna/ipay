//
//  GoalCard.swift
//  Wollen
//
//  Created by José Henrique Fernandes Silva on 12/07/21.
//

import SwiftUI
import Combine

struct GoalCard: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "systemMint")!
    }
    
    @State private var goalBy: GoalBy = .value
    @State private var frequency: FrequencyTypes = .weekly
    @State private var duration: DurationTypes = .weeks
    @State private var valueTextField: String = "R$ 100.00"
    @State private var quantityDuration = 1
    var maxWidth = UIScreen().bounds.width
    
    var body: some View {
        VStack (alignment: .leading) {
            
            HStack {
                Text(LocalizedStringKey("Meta"))
                    .font(.custom("Avenir Next", size: 22).bold())
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Button(action: {
                    // TODO: Ação do botão de informação
                },
                label: {
                    Image(systemName: "info.circle")
                        .foregroundColor(Color.gray)
                })
            }
            
            Picker( selection: $goalBy, label: Text(LocalizedStringKey("Que tipo de meta você prefere?"))) {
                // Link para tutorial:
                //https://www.youtube.com/watch?v=iqKmgs_0VPE
                ForEach(GoalBy.allCases, id: \.self) {
                    Text($0.rawValue)
                        .font(.custom("Avenir", size: 16))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .fixedSize(horizontal: false, vertical: false)
            
            HStack {
                Text(LocalizedStringKey("Frequência:"))
                    .font(.custom("Avenir Next", size: 18))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Picker(selection: $frequency,
                       label:
                        Text(frequency.rawValue)
                        .foregroundColor(.gray)
                        .padding(5)
                        .padding(.horizontal)
                        .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.gray), lineWidth: 1))
                        .multilineTextAlignment(.center)
                        .font(.custom("Avenir Next", size: 16))) {
                    
                    ForEach(FrequencyTypes.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                    
                }.pickerStyle(MenuPickerStyle())
            } // HStack
            
            HStack {
                if goalBy == GoalBy.value {
                    Text(LocalizedStringKey("Valor:"))
                        .font(.custom("Avenir Next", size: 18))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    TextField(String(valueTextField),
                              text: $valueTextField)
                        .padding(5)
                        .foregroundColor(.gray)
                        .font(.custom("Avenir Next", size: 16))
                        .multilineTextAlignment(.leading)
                        .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.gray), lineWidth: 1))
                        .frame(minWidth: 0, idealWidth: 200, maxWidth: maxWidth/3, alignment: .trailing)
                        .keyboardType(.numberPad)
                        .onReceive(Just(valueTextField)) { newValue in
                            let filtered = newValue.filter { "0123456789.,".contains($0) }
                            if filtered != newValue {
                                self.valueTextField = String("R$ \(filtered)")
                            }}
                            
                        } else {
                            Text(LocalizedStringKey("Duração:"))
                                .font(.custom("Avenir Next", size: 18))
                                .fontWeight(.regular)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                            // Picker duplo
                            Picker(selection: $quantityDuration,
                                   label: Text("\(quantityDuration)").foregroundColor(.gray)
                                    .foregroundColor(.gray)
                                    .font(.custom("Avenir Next", size: 16))
                                    .padding(5)
                                    .padding(.horizontal)
                                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.gray), lineWidth: 1))
                                    .multilineTextAlignment(.center)
                            ) {
                                ForEach(1...11, id: \.self) { quantity in
                                    Text("\(quantity)")
                                }
                            }.pickerStyle(MenuPickerStyle())
                            
                            Picker(selection: $duration,
                                   label: Text(duration.rawValue)
                                    .foregroundColor(.gray)
                                    .font(.custom("Avenir Next", size: 16))
                                    .padding(5)
                                    .padding(.horizontal)
                                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(UIColor.gray), lineWidth: 1))
                                    .multilineTextAlignment(.center)
                            ) {
                                ForEach(DurationTypes.allCases, id: \.self) {
                                    Text($0.rawValue)
                                }
                            }.pickerStyle(MenuPickerStyle())
                        }
                } // HStack
            } // VStack
            .padding(15)
            .background(Color(red: 248/256, green: 248/256, blue: 248/256))
            .cornerRadius(10)
            .fixedSize(horizontal: false, vertical: false)
        } // body
    }

enum GoalBy: LocalizedStringKey, CaseIterable {
    case value = "Por valor";
    case period = "Por período";

    var localized: LocalizedStringKey {
            return rawValue
        }
}

    enum FrequencyTypes: LocalizedStringKey, CaseIterable{
        case monthly = "mensal";
        case weekly = "semanal";
        
        var localized: LocalizedStringKey {
                return rawValue
            }
    }
    
    enum DurationTypes: LocalizedStringKey, CaseIterable {
        case years = "anos"
        case weeks = "semanas"
        case months = "meses"
        
        var localized: LocalizedStringKey {
                return rawValue
            }
    }
    
    struct GoalCard_Previews: PreviewProvider {
        static var previews: some View {
            GoalCard()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
