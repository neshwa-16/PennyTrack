//
//  AlertItem.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 23/06/26.
//
import Foundation

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}
