//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 09/06/26.
//

import SwiftUI
import SwiftData
import CoreData

@main
struct ExpenseTrackerApp: App {

    @StateObject private var appState = AppState()
    
    init() {
        if let url = FileManager.default.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        ).first {
            print("Application Support:", url.path)
        }
    }

    var body: some Scene {

        WindowGroup {

            RootView()
                .environmentObject(appState)
        }
        .modelContainer(for: [
            Expense.self,
            Category.self,
            PaymentMethod.self
        ])
    }
}
