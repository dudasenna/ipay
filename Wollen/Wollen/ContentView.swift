//
//  ContentView.swift
//  Wollen
//
//  Created by José Henrique Fernandes Silva on 09/07/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //valor do progresso do desejo
    @State var progressValue: Float = 0.28
    
    @Environment(\.managedObjectContext) private var viewContext

    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    var body: some View {
//        WishGraphCard(progress: self.$progressValue)
//            .frame(width: 150.0, height: 150.0)
//            .padding(40.0)
        Group {
            if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                // iPhone Portrait or iPad 1/3 split view for Multitasking for instance
                VStack {
//                    LinksCard()
//                    DescriptionCard()
                }
            }
            if verticalSizeClass == .compact && horizontalSizeClass == .compact {
                // some "standard" iPhone Landscape (iPhone SE, X, XS, 7, 8, ...)
            } else if verticalSizeClass == .compact && horizontalSizeClass == .regular {
                // some "bigger" iPhone Landscape (iPhone Xs Max, 6s Plus, 7 Plus, 8 Plus, ...)
            } else if verticalSizeClass == .regular && horizontalSizeClass == .regular {
                // macOS or iPad without split view - no Multitasking
                HStack {
                    Rectangle()
                        .frame(minWidth: 0, idealWidth: 240, maxWidth: 240, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                    VStack {
                        MyWishesCards()
//                        DescriptionCard()
//                        LinksCard()
                    }
                    .padding(20)
                    .background(Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1.0))
                }
            }
        }
//        HStack {
//            Rectangle()
//                .frame(minWidth: 0, idealWidth: 240, maxWidth: 240, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
//            VStack {
//                MyWishesCards()
//                HStack {
//                    InformationsCard()
//                    //InformationsCard()
//                    ListaDesejosView()
//                    AddCategoriaView()
//                    ListaCategoriasView()
//                }
//            }
//            if verticalSizeClass == .compact && horizontalSizeClass == .compact {
//                // some "standard" iPhone Landscape (iPhone SE, X, XS, 7, 8, ...)
//            } else if verticalSizeClass == .compact && horizontalSizeClass == .regular {
//                // some "bigger" iPhone Landscape (iPhone Xs Max, 6s Plus, 7 Plus, 8 Plus, ...)
//            } else if verticalSizeClass == .regular && horizontalSizeClass == .regular {
//                // macOS or iPad without split view - no Multitasking
//                HStack {
//                    Rectangle()
//                        .frame(minWidth: 0, idealWidth: 240, maxWidth: 240, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
//                    VStack {
//                        MyWishesCards()
//                        DescriptionCard()
//                        LinksCard()
//                    }
//                    .padding(20)
//                    .background(Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1.0))
//            }
//        }
//
//
//        }
//        List {
//            ForEach(items) { item in
//                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//            }
//            .onDelete(perform: deleteItems)
//        }
//        .toolbar {
//            #if os(iOS)
//            EditButton()
//            #endif
//
//            Button(action: addItem) {
//                Label("Add Item", systemImage: "plus")
//            }
//        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPad Pro (11-inch) (3rd generation)")
    }
}
