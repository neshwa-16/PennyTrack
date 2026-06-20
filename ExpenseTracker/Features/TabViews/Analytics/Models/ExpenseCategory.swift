//
//  ExpenseCategory.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 19/06/26.
//

import Foundation

struct ExpenseCategory: Identifiable {
    let id = UUID()
    let category: String
    let amount: Double
}
