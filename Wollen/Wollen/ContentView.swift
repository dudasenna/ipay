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

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
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
                    LinksCard()
                    DescriptionCard()
                }
            } else if verticalSizeClass == .compact && horizontalSizeClass == .compact {
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
                        DescriptionCard()
                        LinksCard()
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

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPad Pro (11-inch) (3rd generation)").environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
