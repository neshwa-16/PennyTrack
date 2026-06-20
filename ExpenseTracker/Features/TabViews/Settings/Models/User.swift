//
//  User.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 17/06/26.
//
import Foundation

struct SettingsItem: Identifiable {
    let id = UUID()
    let titleText: String
    let iconName: String
    let subTitle: String
    let iconTheme: String
}
