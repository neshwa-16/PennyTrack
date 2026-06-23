//
//  AppState.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 10/06/26.
//

import Combine
import Foundation

final class AppState: ObservableObject {

    @Published var hasCompletedOnboarding = false
    @Published var isLoggedIn = false
    
    let entitlementManager: EntitlementManager
        @Published var purchaseManager: PurchaseManager

        init() {
            entitlementManager = EntitlementManager()
            purchaseManager = PurchaseManager(
                entitlementManager: entitlementManager
            )
        }
}
