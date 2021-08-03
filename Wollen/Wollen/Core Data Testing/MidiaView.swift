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
    
//    let desejoVM: DesejoViewModel
//
//    init() {
//        self.desejoVM =  DesejoViewModel(desejo: Desejo (context: CoreDataManager.shared.viewContext))
//    }
    
    var body: some View {
        
        // Atualiza o conteúdo da variável midias de ListaMidiasViewModel com todas as midias
        //let _ = listaMidiasVM.getAllMidias()
        
        // TO DO Recuperar midia para um desejo especifico
        //let _ = listaMidiasVM.getMidiasFromDesejo(desejo: <#T##DesejoViewModel#>)
        
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
            listaMidiasVM.getAllMidias()
        })
    }
}

struct MidiaView_Previews: PreviewProvider {
    static var previews: some View {
        MidiaView()
    }
}
<<<<<<< HEAD

=======
>>>>>>> b57e4387a3a2abed8092d590727c2a6fddb51299
