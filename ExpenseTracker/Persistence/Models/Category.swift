//
//  Category.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 23/06/26.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Category {
    var id: UUID
    var name: String
    var icon: String
    var iconTheme: String

    init(
        id: UUID = UUID(),
        name: String,
        icon: String,
        iconTheme: String
    ) {
        self.id = id
        self.name = name
        self.icon = icon
        self.iconTheme = iconTheme
    }
}
