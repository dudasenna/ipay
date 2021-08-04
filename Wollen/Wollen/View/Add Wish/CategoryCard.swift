//
//  CategoryCard.swift
//  Wollen
//
//  Created by Eduarda Senna on 27/07/21.
//

import SwiftUI

struct CategoryCard: View {
    @State var categoryColor: String
    @State var categoryTitle: String
    var body: some View {
        VStack(alignment: .center) {
            Text(LocalizedStringKey(categoryTitle))
                .padding(5)
                .font(.custom("Avenir Next", size: 18))
        }
        .padding(5)
        .background(Color(categoryColor))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(categoryColor: "systemYellow", categoryTitle: "Tecnologia")
            .previewDevice("iPhone 11")
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
