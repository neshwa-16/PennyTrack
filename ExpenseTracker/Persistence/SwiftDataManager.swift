//
//  SwiftDataManager.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 23/06/26.
//

import Foundation
import SwiftData

enum SwiftDataManager {

    static let sharedContainer: ModelContainer = {

        do {
            return try ModelContainer(
                for:
                    Expense.self,
                    Category.self,
                    PaymentMethod.self
            )
        } catch {
            fatalError(
                "Failed to create ModelContainer: \(error)"
            )
        }
    }()
}
