//
//  DefaultCategory.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 23/06/26.
//

import Foundation
import SwiftUI

struct DefaultCategory {
    let id = UUID()
    let name: String
    let icon: String
    let iconTheme: String
}

enum DefaultCategories {

    static let all: [DefaultCategory] = [
        .init(name: "Food", icon: "fork.knife", iconTheme: "#FF6800"),
        .init(name: "Transport", icon: "car.fill", iconTheme: "#2C7FFF"),
        .init(name: "Shopping", icon: "bag.fill", iconTheme: "#AD47FF"),
        .init(name: "Bills", icon: "doc.text.fill", iconTheme: "#00C951"),
        .init(name: "Health", icon: "heart.fill", iconTheme: "#F6339A"),
        .init(name: "Entertainment", icon: "tv.fill", iconTheme: "#FF5A5F"),
        .init(name: "Travel", icon: "airplane", iconTheme: "#00A699"),
        .init(name: "Education", icon: "book.fill", iconTheme: "#FFB400")
    ]
}
