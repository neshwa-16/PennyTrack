//
//  PaymentMethod.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 23/06/26.
//

import Foundation
import SwiftData

@Model
class PaymentMethod {
    var id: UUID
    var title: String
    var paymentID: String
    var icon: String

    init(id: UUID = UUID(), title: String, paymentID: String, icon: String) {
        self.id = id
        self.title = title
        self.paymentID = paymentID
        self.icon = icon
    }
}
