//
//  StoreKitError.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 22/06/26.
//


import Foundation

enum StoreKitError: LocalizedError {

    case failedVerification
    case productNotFound
    case purchaseFailed

    var errorDescription: String? {

        switch self {

        case .failedVerification:
            return "Transaction verification failed."

        case .productNotFound:
            return "Product not found."

        case .purchaseFailed:
            return "Purchase failed."
        }
    }
}