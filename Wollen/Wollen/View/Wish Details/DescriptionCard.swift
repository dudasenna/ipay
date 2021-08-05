//
//  DescriptionCard.swift
//  Wollen
//
//  Created by Eduarda Senna on 19/07/21.
//

import SwiftUI

struct DescriptionCard: View {
    
    @StateObject private var updateDesejoVM = UpdateDesejoViewModel()
    
    init(desejoVM: DesejoViewModel) {
        self.desejoVM = desejoVM
    }
    
    var desejoVM: DesejoViewModel
    
    @State var descriptionText: String = "Texto do usuário"
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // TÍTULO - DESCRIÇÃO
            Text(LocalizedStringKey("Descrição"))
                .bold()
                .font(.custom("Avenir Next", size: 22))
                .padding()
            
            // DESCRIÇÃO
            Text(desejoVM.descricao)
        
                .font(.custom("Avenir Next", size: 18))
//                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal)
                .padding(.bottom, 20)
            
        }
        .padding(15)
        .frame(minWidth: 250, idealWidth: 500, maxWidth: 500, minHeight: 120, idealHeight: 120, maxHeight: 150, alignment: .leading)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
    }
}

struct DescriptionCard_Previews: PreviewProvider {
    static var previews: some View {
//        DescriptionCard()
        let desejo = Desejo()
        let desejoVM = DesejoViewModel(desejo: desejo)
        DescriptionCard(desejoVM: desejoVM)
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
