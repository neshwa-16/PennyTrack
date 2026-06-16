//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 09/06/26.
//

import SwiftUI
import CoreData

@main
struct ExpenseTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
