//
//  BudgetRow.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 15/06/26.
//

import SwiftUI

struct BudgetRow: View {
    
    let item : BudgetRowItem
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 10.0) {
                Image(systemName: item.iconName)
                    .font(.system(size: 24.0))
                    .frame(width: 56.0, height: 56.0)
                    .background(Color(item.iconTheme).opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                
                VStack(alignment: .leading) {
                    Text(item.categoryName)
                        .font(.system(size: 14.0))
                    
                    
                    Text(item.amount)
                        .font(.system(size: 16.0))
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                //Text(String(format: "%.2f%%", item.percentage))
                Text("\(Int(item.percentage.rounded()))%")
                    .foregroundStyle(item.percentage > 100.0 ? .red : .black)
                    .font(.system(size: 16.0, weight: .semibold))
            }
            .padding()
            
            ProgressView(value: 0.8)
                .tint(item.percentage >= 100 ? .red : Color(item.iconTheme))
                .padding(.bottom, 18.0)
                .padding(.horizontal, 15.0)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 18.0))
        .shadow(radius: 2.0)
        
    }
}

#Preview {
    BudgetRow(
        item:
            BudgetRowItem(
                iconTheme: "purple",
                iconName: "cart",
                categoryName: "Shopping",
                amount: "$848 of 800",
                percentage: 105.0
            )
    )
}
