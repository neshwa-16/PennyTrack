//
//  EntitlementManager.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 22/06/26.
//

import Foundation
import StoreKit
import Combine

//MARK: This tracks whether the user owns Premium.
@MainActor
final class EntitlementManager: ObservableObject {

    @Published var hasPremium = false

    func refreshEntitlements() async {

        hasPremium = false

        for await result in Transaction.currentEntitlements {

            guard case .verified(let transaction) = result
            else {
                continue
            }

            if transaction.productID ==
                StoreKitProducts.premiumLifetime || transaction.productID == StoreKitProducts.premiumMonthly {
                hasPremium = true
                break
            }
        }
    }
}
