//
//  iDineApp.swift
//  iDine
//
//  Created by Farooq Hassan on 3/4/23.
//

import SwiftUI

@main
struct iDineApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var order = Order()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(order)
        }
    }
}
