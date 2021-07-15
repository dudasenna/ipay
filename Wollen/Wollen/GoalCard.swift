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
        UISegmentedControl.appearance().selectedSegmentTintColor = .cyan
    }
    
    @State private var goalBy: GoalBy = .value
    @State private var frequency: FrequencyTypes = .weekly
    @State private var duration: DurationTypes = .weeks
    @State private var valueTextField: String = "R$ 100,00"
    @State private var quantityDuration = 1
    var maxWidth = UIScreen().bounds.width
    
    var body: some View {
        VStack (alignment: .leading) {
            
            HStack {
                Text("Meta")
                    .font(.custom("Avenir_Next", size: 22))
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
            
            Picker( selection: $goalBy, label: Text("Que tipo de meta você prefere?")) {
                // Link para tutorial:
                //https://www.youtube.com/watch?v=iqKmgs_0VPE
                ForEach(GoalBy.allCases, id: \.self) {
                    Text($0.rawValue)
                        .font(.custom("Avenir_Next", size: 18))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .fixedSize(horizontal: false, vertical: false)
            
            HStack {
                Text("Frequência:")
                    .font(.custom("Avenir_Next", size: 18))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Picker(selection: $frequency,
                       label:
                        Text(frequency.rawValue)
                        .foregroundColor(.gray)
                        .padding(5)
                        .padding(.horizontal)
                        .background(Color(red: 118/256, green: 118/256, blue: 128/256, opacity: 0.12))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .font(.custom("Avenir_Next", size: 16))) {
                    
                    ForEach(FrequencyTypes.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                    
                }.pickerStyle(MenuPickerStyle())
            } // HStack
            
            HStack {
                if goalBy == GoalBy.value {
                    Text("Valor:")
                        .font(.custom("Avenir_Next", size: 18))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    Spacer()
                    
                    TextField(String(valueTextField),
                              text: $valueTextField)
                        .foregroundColor(.gray)
                        .padding(5)
                        .background(Color(red: 118/256, green: 118/256, blue: 128/256, opacity: 0.12))
                        .cornerRadius(10)
                        .multilineTextAlignment(.leading)
                        .font(.custom("Avenir_Next", size: 16))
                        .frame(minWidth: 0, idealWidth: 200, maxWidth: maxWidth/3, alignment: .trailing)
                        .keyboardType(.numberPad)
                        .onReceive(Just(valueTextField)) { newValue in
                            let filtered = newValue.filter { "0123456789.,".contains($0) }
                            if filtered != newValue {
                                self.valueTextField = String("R$ \(filtered)")
                            }}
                            
                        } else {
                            Text("Duração:")
                            
                            Spacer()
                            
                            // Picker duplo
                            Picker(selection: $quantityDuration,
                                   label: Text("\(quantityDuration)").foregroundColor(.gray)
                                    .padding(5)
                                    .padding(.horizontal)
                                    .background(Color(red: 118/256, green: 118/256, blue: 128/256, opacity: 0.12))
                                    .cornerRadius(10)
                                    .multilineTextAlignment(.center)
                                    .font(.custom("Avenir", size: 16))) {
                                ForEach(1...11, id: \.self) { quantity in
                                    Text("\(quantity)")
                                }
                            }.pickerStyle(MenuPickerStyle())
                            
                            Picker(selection: $duration,
                                   label: Text(duration.rawValue)
                                    .foregroundColor(.gray)
                                    .font(.custom("Avenir", size: 16))
                                    .padding(5)
                                    .padding(.horizontal)
                                    .background(Color(red: 118/256, green: 118/256, blue: 128/256, opacity: 0.12))
                                    .cornerRadius(10)
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
    
    enum GoalBy: String, CaseIterable {
        case value = "Por valor"
        case period = "Por período"
    }
    
    enum FrequencyTypes: String, CaseIterable{
        case monthly = "mensal";
        case weekly = "semanal";
    }
    
    enum DurationTypes: String, CaseIterable {
        case years = "anos"
        case weeks = "semanas"
        case months = "meses"
    }
    
    struct GoalCard_Previews: PreviewProvider {
        static var previews: some View {
            GoalCard()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
