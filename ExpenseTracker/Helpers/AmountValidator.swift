//
//  AmountValidator.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 23/06/26.
//
import Foundation

enum AmountValidator {

    static func sanitize(_ value: String) -> String {

        let filtered = value.filter {
            $0.isNumber || $0 == "."
        }

        var result = ""
        var hasDecimal = false

        for char in filtered {
            if char == "." {
                guard !hasDecimal else { continue }
                hasDecimal = true
            }

            result.append(char)
        }

        return result
    }
}
