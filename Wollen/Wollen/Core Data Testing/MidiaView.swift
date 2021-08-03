//
//  MidiaView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 28/07/21.
//

import SwiftUI

struct MidiaView: View {
    
    // Recupera todas as midias
    
    @StateObject private var listaMidiasVM = ListaMidiasViewModel()
    
    let desejoVM: DesejoViewModel
    
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
               
                ForEach(listaMidiasVM.midias, id: \.id) { midia in
                    let image = listaMidiasVM.getImageFromMidia(midia: midia)
                    Image(uiImage: image)
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 120, height: 89)
                        .cornerRadius(6)
                    
                }
            }
        }
        .onAppear(perform: {
            // Recupera as midias para um desejo especifico
            listaMidiasVM.getMidiasFromDesejo(desejo: desejoVM)
        })
    }
}

struct MidiaView_Previews: PreviewProvider {
    static var previews: some View {
        
        let desejoVM = DesejoViewModel(desejo: Desejo(context: CoreDataManager.shared.viewContext))
        
        MidiaView(desejoVM: desejoVM)
    }
}

