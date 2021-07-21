//
//  DesejoView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 20/07/21.
//

import SwiftUI

struct DesejoView: View {
    
    let desejoVM: DesejoViewModel
    
    var body: some View {
        VStack{
            DetalhesDesejo(desejo: desejoVM)
        }
    }
}

struct DesejoView_Previews: PreviewProvider {
    static var previews: some View {
        
        let desejoVM = DesejoViewModel(desejo: Desejo(context: CoreDataManager.shared.viewContext))
        DesejoView(desejoVM: desejoVM)
    }
}
