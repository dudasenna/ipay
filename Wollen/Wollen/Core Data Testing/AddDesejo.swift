//
//  AddDesejo.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 21/07/21.
//

import SwiftUI

struct AddDesejo: View {
    let categoriaVM: CategoriaViewModel
    let desejoVM:DesejoViewModel
    
    var body: some View {
        HStack {
            AddDesejoToCategoriaView(categoriaVM: categoriaVM)
            AddMetaToDesejoView(desejoVM: desejoVM)
        }
    }
}

struct AddDesejo_Previews: PreviewProvider {
    static var previews: some View {
        let categoriaVM = CategoriaViewModel(categoria: Categoria(context: CoreDataManager.shared.viewContext))
        
        let desejoVM = DesejoViewModel(desejo: Desejo(context: CoreDataManager.shared.viewContext))
        AddDesejo(categoriaVM: categoriaVM, desejoVM: desejoVM)
    }
}
