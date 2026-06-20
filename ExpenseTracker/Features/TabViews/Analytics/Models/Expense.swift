//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 19/06/26.
//
import Foundation

struct ExpenseMonth: Identifiable, Equatable {
    let id = UUID()
    let month: String
    let amount: Double
}
