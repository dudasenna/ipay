//
//  GalleryCard.swift
//  Wollen
//
//  Created by José Henrique Fernandes Silva on 19/07/21.
//

import SwiftUI

struct GalleryCard: View {
    
    init(desejoVM: DesejoViewModel) {
        self.desejoVM = desejoVM
    }
    
    @StateObject var listaMidiasVM = ListaMidiasViewModel()
    var desejoVM: DesejoViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Título:
                HStack {
                    Text(LocalizedStringKey("Galeria"))
                        .font(.custom("Avenir Next", size: 22).bold())
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading])
                    Spacer()
                }
                
                // Imagens:
                ScrollView {
                    VStack (alignment: .center) {
                        ForEach(listaMidiasVM.midias, id: \.id) { midia in
                            let image = listaMidiasVM.getImageFromMidia(midia: midia)
                            imageTreated(image: image, width: geometry.size.width)
                        }
                    }
                }.padding()
            }
            .background(Color(red: 248/256, green: 248/256, blue: 248/256))
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.4), radius: 5)
        }.onAppear() {
            listaMidiasVM.getMidiasFromDesejo(desejo: desejoVM)
        }
        
    }
    
    func imageTreated(image: UIImage, width: CGFloat) -> some View {
        let image = Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width*0.8)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                .shadow(color: Color.gray.opacity(0.4), radius: 5)
        return image
    }
}

struct GalleryCard_Previews: PreviewProvider {
    static var previews: some View {
        let listaMidiasVM = ListaMidiasViewModel()
        let desejo = Desejo()
        let desejoVM = DesejoViewModel(desejo: desejo)

        GalleryCard(desejoVM: desejoVM)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
