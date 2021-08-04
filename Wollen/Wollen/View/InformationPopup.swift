//
//  InformationPopup.swift
//  Wollen
//
//  Created by José Henrique Fernandes Silva on 02/08/21.
//

import SwiftUI

struct InformationPopup: View {
    var body: some View {
        VStack (alignment: .leading)
        {
            
            Text("Informações sobre a Meta")
                .font(.custom("Avenir Next", size: 18).bold())
                .foregroundColor(Color("preto_primario"))
                .multilineTextAlignment(.leading)
                .padding()
            
            Divider()
            
            Text("Por valor:")
                .font(.custom("Avenir Next", size: 18).bold())
                .foregroundColor(Color("preto_primario"))
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            Text("Defina quanto você quer economizar toda semana ou mês.")
                .font(.custom("Avenir Next", size: 18))
                .foregroundColor(Color("preto_primario"))
                .padding(.horizontal)
            Text("E descubra quanto tempo você vai levar para alcançar a sua meta.")
                .font(.custom("Avenir Next", size: 18))
                .foregroundColor(Color("preto_primario"))
                .padding([.horizontal, .bottom])
            
            Text("Por período:")
                .font(.custom("Avenir Next", size: 18).bold())
                .foregroundColor(Color("preto_primario"))
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            Text("Defina uma duração máxima para alcançar a meta.")
                .font(.custom("Avenir Next", size: 18))
                .foregroundColor(Color("preto_primario"))
                .padding(.horizontal)
            Text("E descubra quanto você precisa economizar toda semana ou mês.")
                .font(.custom("Avenir Next", size: 18))
                .foregroundColor(Color("preto_primario"))
                .padding([.horizontal, .bottom])
        }
    }
}

struct InformationPopup_Previews: PreviewProvider {
    static var previews: some View {
        InformationPopup()
    }
}
