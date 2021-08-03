//
//  DetailsCards.swift
//  Wollen
//
//  Created by Palloma Ramos on 03/08/21.
//

import SwiftUI

struct DetailsCards: View {
    
    var body: some View {
        
//        NavigationView{
        
        VStack (alignment: .center, spacing: 30) {
            
            HStack (alignment: .top){
                
                HStack{
                
                NavigationLink(
                    destination:
                        HomeView(),
                    label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color(UIColor(named: "systemMint")!))
                            .imageScale(.large)
                        
                    }) .padding()
                
                    VStack(alignment: .leading){
                Text(LocalizedStringKey("Kindle"))
                    .bold()
                    .font(.custom("Avenir Next", size: 30))

                Text(LocalizedStringKey("Tecnologia"))
                    .font(.custom("Avenir Next", size: 18))
                }
                }
                
                Spacer()
                
                HStack(alignment: .center, spacing:10){
                    
                Button(
                    action: {
                        
                    }, label: {
                        Image(systemName: "trash")
                            .foregroundColor(Color(UIColor(named: "systemMint")!))
                            .imageScale(.large)
                    })
                NavigationLink(
                    destination:
                        AddWishView(),
                    label: {
                        Image(systemName: "pencil")
                            .foregroundColor(Color(UIColor(named: "systemMint")!))
                            .imageScale(.large)
                        
                    })
            }
            }
//            ScrollView(.vertical){
                
            HStack (alignment: .top, spacing:30){
                
                VStack(alignment: .leading, spacing:30){

                    CardSaveMoney(goal: 50)
                    
                        .frame(minWidth: 100, idealWidth: 502, maxWidth: 515, minHeight: 100, idealHeight: 150, maxHeight: 155, alignment: .leading)
                    
                    HStack (alignment: .top, spacing: 30) {
                        WishGoalCard()
                        WishGraphCard(progress: 0.8)
                       
                    } .padding(.bottom)
                    .padding(.top)
                    DescriptionCard()
                    LinksCard()
                    
                }
                GalleryCard()
                    
                    .frame(minWidth: 100, idealWidth: 251.17, maxWidth: 251.17, minHeight: 300, idealHeight: 813, maxHeight: 830, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
//                Spacer()
//
            Button {

            } label: {
                Text(LocalizedStringKey("Salvar"))
                    .foregroundColor(Color(UIColor(named: "preto_primario")!))
                    .font(.custom("Avenir Next", size: 18).bold())
                    .padding(5)
            }
            .padding(5)
            .background(Color(UIColor(named: "systemMint")!))
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.4), radius: 5)
            
        }
            
//        }
        .padding(30)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
        }
//        .padding(.all)
//    }
//
}
//}
struct DetailsCards_Previews: PreviewProvider {
    static var previews: some View {
        DetailsCards()
    }
}
