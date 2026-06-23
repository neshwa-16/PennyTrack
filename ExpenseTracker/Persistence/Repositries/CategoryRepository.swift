//
//  CategoryRepository.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 23/06/26.
//

import SwiftUI
import SwiftData

@MainActor
final class CategoryRepository {

    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }
    
    func seedDefaultCategories() throws {

        let descriptor =
            FetchDescriptor<Category>()
        
        let descriptorExpense = FetchDescriptor<Expense>()
        let expenses = try context.fetch(descriptorExpense)
        
        for expense in expenses {
            print(expense.amount, expense.category.name)
        }

        let existing =
            try context.fetch(descriptor)

        guard existing.isEmpty else {
            return
        }

        for item in DefaultCategories.all {

            let category = Category(
                id: item.id,
                name: item.name,
                icon: item.icon,
                iconTheme: item.iconTheme
            )

            context.insert(category)
        }

        try context.save()
    }

    func addCategory(
        name: String,
        icon: String,
        iconTheme: String
    ) throws {

        let category = Category(
            name: name,
            icon: icon,
            iconTheme: iconTheme
        )

        context.insert(category)

        try context.save()
    }

    func deleteCategory(
        _ category: Category
    ) throws {

        context.delete(category)

        try context.save()
    }
    
    func updateCategory(_ category: Category, name: String, icon: String) throws {
        
        category.name = name
        category.icon = icon
        
        try context.save()
    }
}
