//
//  PaymentMethodRepository.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 23/06/26.
//


import SwiftData

@MainActor
final class PaymentMethodRepository {

    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func addPaymentMethod(
        id: String,
        name: String,
        icon: String,
        paymentID: String
    ) throws {

        let paymentMethod =
            PaymentMethod(
                title: name,
                paymentID: paymentID,
                icon: icon
            )

        context.insert(
            paymentMethod
        )

        try context.save()
    }

    func deletePaymentMethod(
        _ paymentMethod:
        PaymentMethod
    ) throws {

        context.delete(
            paymentMethod
        )

        try context.save()
    }
}
