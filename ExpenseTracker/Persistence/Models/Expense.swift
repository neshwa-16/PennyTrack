//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 23/06/26.
//

import Foundation
import SwiftData

@Model
class Expense {
    var id : UUID
    var title: String?
    var amount: Double
    var date: Date
    var category: Category
    var note : String?
    
    @Relationship
    var paymentMethod: PaymentMethod?

    init(id: UUID = UUID(),title: String?, amount: Double, date: Date, category: Category, note: String?, paymentMethod: PaymentMethod? = nil) {
        self.id = id
        self.title = title
        self.amount = amount
        self.date = date
        self.category = category
        self.note = note
        self.paymentMethod = paymentMethod
    }
}
