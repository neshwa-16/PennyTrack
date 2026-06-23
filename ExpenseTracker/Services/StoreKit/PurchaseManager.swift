//
//  PurchaseManager.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 22/06/26.
//

import StoreKit
import Combine

@MainActor
final class PurchaseManager: ObservableObject {

    @Published var products: [Product] = []
    @Published var isLoading = false

    private let entitlementManager:
    EntitlementManager

    init(
        entitlementManager: EntitlementManager
    ) {

        self.entitlementManager =
        entitlementManager

        listenForTransactions()
    }

    func loadProducts() async {

        do {

            products =
            try await Product.products(
                for: StoreKitProducts.all
            )

        } catch {

            print(error.localizedDescription)
        }
    }

    func purchase(
        _ product: Product
    ) async throws {

        let result = try await product.purchase()

        switch result {

        case .success(let verification):

            let transaction =
            try checkVerified(
                verification
            )

            await transaction.finish()

            await entitlementManager
                .refreshEntitlements()

        case .userCancelled:
            return

        case .pending:
            return

        @unknown default:
            return
        }
    }

    func restorePurchases() async {

        do {

            try await AppStore.sync()

            await entitlementManager
                .refreshEntitlements()

        } catch {

            print(error.localizedDescription)
        }
    }
}

extension PurchaseManager {

    private func listenForTransactions() {

        Task {

            for await result
            in Transaction.updates {

                do {

                    let transaction =
                    try checkVerified(result)

                    await transaction.finish()

                    await entitlementManager
                        .refreshEntitlements()

                } catch {

                    print(error.localizedDescription)
                }
            }
        }
    }

    private func checkVerified<T>(
        _ result:
        VerificationResult<T>
    ) throws -> T {

        switch result {

        case .verified(let safe):
            return safe

        case .unverified:
            throw StoreKitError.failedVerification
        }
    }
}
