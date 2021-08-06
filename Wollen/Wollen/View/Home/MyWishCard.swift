//
//  MyWishCard.swift
//  Wollen
//
//  Created by Eduarda Senna on 13/07/21.
//

import SwiftUI

struct MyWishCard: View {
    // de 0.0 a 1.0
    @State private var downloadAmount: Float = 0.7
    
    //Core Data
    let desejoVM: DesejoViewModel
    @StateObject private var listaMidiasVM = ListaMidiasViewModel()
    
    @ObservedObject var listaMetasVM = ListaMetasViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            
            let image = listaMidiasVM.getImageFromMidia(midia: desejoVM.midiaVM)
            Image(uiImage: image)
            //Image(uiImage: UIImage(named: "teste")!)
                .resizable()
                .frame(minWidth: 0, idealWidth: 220, maxWidth: 220, minHeight: 0, idealHeight: 130, maxHeight: 130, alignment: .center)
                .scaledToFit()
                .cornerRadius(10)
            Text(desejoVM.nome)
                .font(.custom("Avenir Next", size: 16))
            ProgressBar(value: $downloadAmount, desejoVM: desejoVM).frame(minWidth: 0, idealWidth: 220, maxWidth: 220, minHeight: 0, idealHeight: 20, maxHeight: 20, alignment: .center)
                .padding(.bottom, 5)

        })
        .onAppear() {
            self.listaMetasVM.getMetaFromDesejo(desejo: desejoVM)
            let savedMoney = desejoVM.desejo.meta?.valorAtual
            let goalMoney = desejoVM.preco
            self.downloadAmount = Float(savedMoney ?? 0 / goalMoney)
        }
        
        .padding(10)
        .background(Color(red: 248/256, green: 248/256, blue: 248/256))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

struct ProgressBar: View {
    // TO DO Associar este valor com o valor do Core Data valorAtual/valorMeta
    @Binding var value: Float
    
    let desejoVM: DesejoViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack (alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .foregroundColor(Color(UIColor.white))
                Rectangle().frame(width: min(CGFloat(value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor(named: desejoVM.desejo.categoria?.cor ?? "systemMint")!))
                    .cornerRadius(10)
            }.cornerRadius(45.0)
            .shadow(color: Color.gray.opacity(0.1), radius: 4, x: 0, y: 2)
        }
    }
}

struct MyWishCard_Previews: PreviewProvider {
    static var previews: some View {
        let desejoVM = DesejoViewModel(desejo: Desejo(context: CoreDataManager.shared.viewContext))
        
        MyWishCard(desejoVM: desejoVM)
            .previewLayout(.sizeThatFits)
            .padding()
            .cornerRadius(10)
    }
}
