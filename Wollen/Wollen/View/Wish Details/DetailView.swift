//
//  DetailView.swift
//  Wollen
//
//  Created by Palloma Ramos on 03/08/21.
//

import SwiftUI

struct DetailView: View {
    
    init(desejoVM: DesejoViewModel) {
        self.desejoVM = desejoVM
    }
    
    var desejoVM: DesejoViewModel
    
    var body: some View {
        ZStack {
            (Color(UIColor(named: "branco_bg")!))
                .ignoresSafeArea(.all)
            
           DetailsCards(desejoVM: desejoVM)
        }
        .padding(30)
        .navigationBarHidden(true)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let desejo = Desejo()
        let desejoVM = DesejoViewModel(desejo: desejo)
        DetailsCards(desejoVM: desejoVM)
    }
}
