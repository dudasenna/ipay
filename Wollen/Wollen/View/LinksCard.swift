//
//  LinksCard.swift
//  Wollen
//
//  Created by Eduarda Senna on 19/07/21.
//

import SwiftUI

struct LinksCard: View {
    @State var linkName: [String] = ["Apple", "Apple Brasil", "Google", "Apple", "Apple Brasil", "Google", "Apple", "Apple Brasil", "Google"]
    @State var links: [String] = ["https://www.apple.com", "https://www.apple.com.br", "https://www.google.com", "https://www.apple.com", "https://www.apple.com.br", "https://www.google.com", "https://www.apple.com", "https://www.apple.com.br", "https://www.google.com"]
    
    private var adaptiveLayout = [GridItem(.adaptive(minimum: 150))]
    private var flexibleLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // TÍTULO - LINKS
            Text("Links")
                .bold()
                .font(.custom("Avenir Next", size: 22))
                .padding()
            
            // LINKS
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid (columns: adaptiveLayout, alignment: .center, spacing: 0){
                    ForEach (0..<links.count) { link in
                        Link(linkName[link], destination: URL(string: links[link])!)
                            .font(.custom("Avenir Next", size: 18))
            //                .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.horizontal)
                            .padding(.bottom)
                            
                    }
                }
            }
            
        }
        .padding(15)
        .frame(minWidth: 250, idealWidth: 500, maxWidth: 500, minHeight: 120, idealHeight: 120, maxHeight: 150, alignment: .leading)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
    }
}

struct LinksCard_Previews: PreviewProvider {
    static var previews: some View {
        LinksCard()
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
