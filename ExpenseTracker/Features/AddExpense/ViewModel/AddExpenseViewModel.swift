//
//  AddExpenseViewModel.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 23/06/26.
//
import Foundation
import Combine
import SwiftData

@MainActor
final class AddExpenseViewModel:
ObservableObject {

    @Published var title = ""
    @Published var amount = ""
    @Published var date = Date()
    @Published var note = ""
    
    @Published var selectedCategory: Category?
    @Published var selectedPaymentMethod: PaymentMethod?
    
    @Published var alertItem: AlertItem?
    
    //MARK: Validate amount, category
    func validate() -> Bool {
        guard !amount.isEmpty else {
            alertItem = AlertItem(title: "Validation Error", message: "Amount is required")
            return false
        }
        
        guard let value = Double(amount), value > 0 else {
            alertItem = AlertItem(title: "Validation Error", message: "Enter a valid amount")
            return false
        }

        guard selectedCategory != nil else {
            alertItem = AlertItem(title: "Validation Error", message: "Please select a category")
            return false
        }
        
        return true
    }

    func save(context: ModelContext) {
        
        guard validate() else { return }
        
        guard let category = selectedCategory else {
            return
        }
        
        let repository = ExpenseRepository(context: context)
        
        do {
            try repository.addExpense(
                title: title,
                amount: Double(amount) ?? 0,
                date: .now,
                category: category,
                paymentMethod: selectedPaymentMethod,
                note: note
            )
        } catch {
            print(error)
        }
    }
}
