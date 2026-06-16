//
//  CategoryRow.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 12/06/26.
//

import SwiftUI

struct CategoryRow: View {
    
    let item: CategoryRowItem
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 15.0) {
            Image(systemName: item.iconName)
                .font(.system(size: 24.0))
                //.foregroundStyle(Color(item.iconTheme))
                .frame(width: 56.0, height: 56.0)
                .background(Color(item.iconTheme).opacity(0.1))
                .clipShape(
                    RoundedRectangle(cornerRadius: 16.0)
                )
            
            VStack(alignment: .leading, spacing: 7.0) {
                
                HStack {
                    Text(item.categoryName)
                    
                    Spacer()
                    
                    Text(item.amount)
                }
                .font(.system(size: 18.0))
                .foregroundStyle(.black)
                
                ProgressView(value: 0.35)
                    .tint(Color(item.iconTheme))
                    
            }
            .frame(maxWidth: .infinity)
        }
        .padding(5.0)
        
    }
}

#Preview {
    CategoryRow(
        item: CategoryRowItem(
            iconTheme: "blue",
            iconName: "cart",
            categoryName: "Shopping",
            amount: "$842.00")
    )
}
