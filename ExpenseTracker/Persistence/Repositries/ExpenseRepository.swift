//
//  ExpenseRepository.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 23/06/26.
//

import Foundation
import SwiftData

@MainActor
final class ExpenseRepository {
    
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func addExpense(
        title: String?,
        amount: Double,
        date: Date,
        category: Category,
        paymentMethod: PaymentMethod?,
        note: String?
    ) throws {
        
        let expense = Expense(
            title: title,
            amount: amount,
            date: date,
            category: category,
            note: note,
            paymentMethod: paymentMethod)
        
        context.insert(expense)
        
        try context.save()
    }
    
    func deleteExpense(_ expense: Expense) throws {
        context.delete(expense)
        try context.save()
    }
    
    func updateExpense(
        _ expense: Expense,
           title: String?,
           amount: Double
    ) throws {
        expense.title = title
        expense.amount = amount
        try context.save()
    }
}
