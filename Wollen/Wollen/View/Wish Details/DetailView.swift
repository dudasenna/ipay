//
//  DetailView.swift
//  Wollen
//
//  Created by Palloma Ramos on 03/08/21.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack {
            (Color(UIColor(named: "branco_bg")!))
                .ignoresSafeArea(.all)
            
           DetailsCards()
        }
        .padding(30)
        .navigationBarHidden(true)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsCards()
    }
}
