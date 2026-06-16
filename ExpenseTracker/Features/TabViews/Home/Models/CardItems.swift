//
//  CardItems.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 12/06/26.
//

import Foundation

struct CardItems : Identifiable {
    let id = UUID()
    let cardTitle: String
    let cardAmount: String
    let titleColor: String
}
