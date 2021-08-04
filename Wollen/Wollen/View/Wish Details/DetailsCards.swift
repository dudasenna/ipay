//
//  DetailsCards.swift
//  Wollen
//
//  Created by Palloma Ramos on 03/08/21.
//

import SwiftUI

struct DetailsCards: View {
    
    init(desejoVM: DesejoViewModel) {
        self.desejoVM = desejoVM
    }
    
    var desejoVM: DesejoViewModel
    
    var body: some View {
        
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
                Text(desejoVM.nome)
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
                
            HStack (alignment: .top, spacing:30){
                
                ScrollView{
                
                    VStack(alignment: .leading, spacing:50){

                    CardSaveMoney(goal: 50)
                    
                        .frame(minWidth: 100, idealWidth: 502, maxWidth: 515, minHeight: 100, idealHeight: 150, maxHeight: 155, alignment: .leading)
                    
                        HStack (alignment: .center, spacing:20) {
                            
                        WishGoalCard()
                        WishGraphCard(progress: 0.8)
                        
                    }
//                            .padding(.bottom)
//                    .padding(.top)
                    DescriptionCard(desejoVM: desejoVM)
                    LinksCard(desejoVM: desejoVM)
                    
                    } .padding()
                }
                
                GalleryCard(desejoVM: desejoVM)
                    
                    .frame(minWidth: 100, idealWidth: 251.17, maxWidth: 251.17, minHeight: 300, idealHeight: 813, maxHeight: 830, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }

        }
            
        .padding(30)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
        }

}
struct DetailsCards_Previews: PreviewProvider {
    static var previews: some View {
        let desejo = Desejo()
        let desejoVM = DesejoViewModel(desejo: desejo)
        DetailsCards(desejoVM: desejoVM)
    }
}
