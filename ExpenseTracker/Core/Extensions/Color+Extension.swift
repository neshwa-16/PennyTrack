//
//  Color+Extension.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 23/06/26.
//

import Foundation
import SwiftUI

import SwiftUI

extension Color {
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        
        Scanner(string: hex).scanHexInt64(&int)
        
        let r = Double((int >> 16) & 0xFF) / 255.0
        let g = Double((int >> 8) & 0xFF) / 255.0
        let b = Double(int & 0xFF) / 255.0
        
        self.init(.sRGB, red: r, green: g, blue: b, opacity: 1.0)
    }
}
