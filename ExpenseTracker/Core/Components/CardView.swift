//
//  CardView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 12/06/26.
//

import SwiftUI

struct CardView: View {
    
    let item : CardItems
    
    var body: some View {
    
        ZStack(alignment: .leading) {
            
            RoundedRectangle(cornerRadius: 20.0)
                .fill(.white)
                .shadow(
                    color: .black.opacity(0.1),
                    radius: 4.0,
                    x: 0,
                    y: 1
                )
                .frame(height: 100.0)
            
            VStack(alignment: .leading, spacing: 15) {
                
                Text(item.cardTitle)
                    .font(.system(size: 15.0))
                    .foregroundStyle(Color(item.titleColor))
                    
                Text(item.cardAmount)
                    .font(.system(size: 20.0))
            }
            .padding(15.0)
        }
        .padding(5.0)
        
    }
}

#Preview {
    CardView(
        item:
            CardItems(
                cardTitle: "Expense",
                cardAmount: "$4,000",
                titleColor: "red"
            )
    )
}
