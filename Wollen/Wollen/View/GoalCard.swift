//
//  GoalCard.swift
//  Wollen
//
//  Created by José Henrique Fernandes Silva on 12/07/21.
//

import SwiftUI
import Combine

struct GoalCard: View {
    
    init(desejo: AddDesejoViewModel) {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "systemMint")!
        self.desejo = desejo
        //self.desejo.tipo = "Por valor"
    }
    
    @State private var goalBy: GoalBy = .value
    @State private var frequency: FrequencyTypes = .weekly
    @State private var duration: DurationTypes = .weeks
    @State private var valueTextField: String = "R$ 100.00"
    @State private var quantityDuration = 1
    @State private var showInformationPopup: Bool = false
    @ObservedObject var desejo: AddDesejoViewModel
    var maxWidth = UIScreen().bounds.width
    @State private var valuePlaceholder = "R$ 100.0"
    
    var body: some View {
        VStack (alignment: .leading) {
            
            HStack {
                Text(LocalizedStringKey("Meta"))
                    .font(.custom("Avenir Next", size: 22).bold())
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Button(action: {
                    self.showInformationPopup.toggle()
                },
                label: {
                    Image(systemName: "info.circle")
                        .foregroundColor(Color("preto_secundario"))
                })
                .popover(isPresented: $showInformationPopup) {
                    InformationPopup()
                }
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
            .onChange(of: goalBy) { _ in
                if goalBy.rawValue == LocalizedStringKey("Por valor") {
                    desejo.tipo = "Por valor"
                } else {
                    desejo.tipo = "Por período"
                }
            }
            
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
                    
                }
                .pickerStyle(MenuPickerStyle())
                .onChange(of: frequency) { _ in
                    self.desejo.frequencia = convertFromFrequencyToString(frequency: self.frequency)
                }
                .onTapGesture {
                    self.desejo.frequencia = convertFromFrequencyToString(frequency: self.frequency)
                }
            } // HStack
            
            HStack {
                if goalBy == GoalBy.value {
                    Text(LocalizedStringKey("Valor:"))
                        .font(.custom("Avenir Next", size: 18))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    TextField(
                        String(valuePlaceholder),
                        text: $valuePlaceholder
                    )
                    .padding(5)
                    .foregroundColor(.gray)
                    .font(.custom("Avenir Next", size: 16))
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
                    .onChange(of: valueTextField) { _ in
                        self.desejo.valorMeta = self.valueTextField
                    }
                    .onTapGesture {
                        self.desejo.valorMeta = self.valueTextField
                    }
                    
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
                    .onChange(of: quantityDuration) { _ in
                        self.desejo.duracao = self.quantityDuration
                    }
                    .onTapGesture {
                        self.desejo.duracao = self.quantityDuration
                    }
                    
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
                    .onChange(of: self.duration) { _ in
                        self.desejo.duracao2 = convertFromDurationToString(duration: self.duration)
                    }
                    .onTapGesture {
                        self.desejo.duracao2 = convertFromDurationToString(duration: self.duration)
                    }
                }
            } // HStack
        } // VStack
        .padding(15)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .fixedSize(horizontal: false, vertical: false)
    } // body
    
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
    case months = "meses"
    case weeks = "semanas"
    
    var localized: LocalizedStringKey {
        return rawValue
    }
}

func convertFromFrequencyToString(frequency: FrequencyTypes) -> String {
    switch frequency.rawValue {
    case "mensal":
        return "mensal"
    case "semanal":
        return "semanal"
    default:
        return ""
    }
}

func convertFromDurationToString(duration: DurationTypes) -> String {
    switch duration.rawValue {
    case "anos":
        return "anos"
    case "meses":
        return "meses"
    case "semanas":
        return "semanas"
    default:
        return ""
    }
}

struct GoalCard_Previews: PreviewProvider {
    static var previews: some View {
        let desejo = AddDesejoViewModel()
        GoalCard(desejo: desejo)
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
