//
//  EditWishView.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 04/08/21.
//

import SwiftUI

struct EditWishView: View {
    let desejoVM: DesejoViewModel
    var body: some View {
        ZStack {
            (Color(UIColor(named: "branco_bg")!))
                .ignoresSafeArea(.all)
            
            EditWishCards(desejoVM: desejoVM)
        }
        .padding(30)
        .navigationBarHidden(true)
    }
}

struct EditWishView_Previews: PreviewProvider {
    static var previews: some View {
        let desejoVM = DesejoViewModel(desejo: Desejo(context: CoreDataManager.shared.viewContext))
        EditWishView(desejoVM: desejoVM)
    }
}
