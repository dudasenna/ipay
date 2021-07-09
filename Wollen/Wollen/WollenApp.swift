//
//  WollenApp.swift
//  Wollen
//
//  Created by José Henrique Fernandes Silva on 09/07/21.
//

import SwiftUI

@main
struct WollenApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
