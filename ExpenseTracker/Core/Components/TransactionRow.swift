//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 12/06/26.
//

import SwiftUI

struct TransactionRow: View {
    
    let item: TransactionItem
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 15.0) {
            Image(systemName: item.iconName)
                .font(.system(size: 24.0))
                .foregroundStyle(Color(item.iconTheme))
                .frame(width: 56.0, height: 56.0)
                .background(Color(item.iconTheme).opacity(0.1))
                .clipShape(
                    RoundedRectangle(cornerRadius: 20.0)
                )
            
            VStack(alignment: .leading, spacing: 7.0) {
                HStack {
                    Text(item.categoryName)
                }
                .font(.system(size: 18.0))
                .foregroundStyle(.black)
                
                Text(item.date)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Text(item.amount)
        }
        .background(.white)
        .padding(5.0)
    }
}

struct TransactionItemRow: View {
    
    let item: TransactionItem
    
    var body: some View {
        
        ZStack {
            HStack(alignment: .center, spacing: 15.0) {
                Image(systemName: item.iconName)
                    .font(.system(size: 24.0))
                    .foregroundStyle(Color(item.iconTheme))
                    .frame(width: 56.0, height: 56.0)
                    .background(Color(item.iconTheme).opacity(0.1))
                    .clipShape(
                        RoundedRectangle(cornerRadius: 20.0)
                    )
                
                VStack(alignment: .leading, spacing: 7.0) {
                    HStack {
                        Text(item.categoryName)
                    }
                    .font(.system(size: 18.0))
                    .foregroundStyle(.black)
                    
                    Text(item.date)
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                Text(item.amount)
            }
            .background(.white)
            .padding(.vertical, 15.0)
            .padding(.horizontal, 15.0)
            
        }
        .background(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 20.0)
        )
        
    }
}


#Preview {
    TransactionItemRow(
        item: TransactionItem(
            iconTheme: "purple",
            iconName: "cart",
            categoryName: "Grocery Store",
            amount: "-$85.20",
            date: "Today")
    )
}
