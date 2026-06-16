//
//  TransactionsView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 12/06/26.
//

import SwiftUI

struct TransactionsView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        
        let transactions = [
            TransactionItem(
                iconTheme: "purple",
                iconName: "cart",
                categoryName: "Whole Foods Market",
                amount: "-$12.50",
                date: "Today, 2:30 PM"
            ),
            TransactionItem(
                iconTheme: "orange",
                iconName: "fork.knife",
                categoryName: "Starbucks Coffee",
                amount: "+$4,200.00",
                date: "Today, 9:15 AM"
            ),
            TransactionItem(
                iconTheme: "green",
                iconName: "house",
                categoryName: "Monthly Salary",
                amount: "-$42.50",
                date: "Yestedrday"
            ),
            TransactionItem(
                iconTheme: "orange",
                iconName: "fork.knife",
                categoryName: "Italian Restaurant",
                amount: "-$65.0",
                date: "Jun 8, 7:45 PM"
            ),
            TransactionItem(
                iconTheme: "blue",
                iconName: "car.side",
                categoryName: "Shell Gas Stationt",
                amount: "-$125.00",
                date: "Jun 7, 5:20 PM"
            ),
            TransactionItem(
                iconTheme: "green",
                iconName: "house",
                categoryName: "Electric Bill",
                amount: "-$89.99",
                date: "Jun 6"
            ),
            TransactionItem(
                iconTheme: "purple",
                iconName: "cart",
                categoryName: "Amazon Purchase",
                amount: "-$18.50",
                date: "June 5"
            ),
            TransactionItem(
                iconTheme: "blue",
                iconName: "car.side",
                categoryName: "Uber Ride",
                amount: "-$20.20",
                date: "Jun 4"
            ),
            TransactionItem(
                iconTheme: "green",
                iconName: "house",
                categoryName: "Electric Bill",
                amount: "-$89.99",
                date: "Jun 6"
            ),
            TransactionItem(
                iconTheme: "purple",
                iconName: "cart",
                categoryName: "Amazon Purchase",
                amount: "-$18.50",
                date: "June 5"
            ),
            TransactionItem(
                iconTheme: "blue",
                iconName: "car.side",
                categoryName: "Uber Ride",
                amount: "-$20.20",
                date: "Jun 4"
            ),
            TransactionItem(
                iconTheme: "green",
                iconName: "house",
                categoryName: "Electric Bill",
                amount: "-$89.99",
                date: "Jun 6"
            ),
            TransactionItem(
                iconTheme: "purple",
                iconName: "cart",
                categoryName: "Amazon Purchase",
                amount: "-$18.50",
                date: "June 5"
            ),
            TransactionItem(
                iconTheme: "blue",
                iconName: "car.side",
                categoryName: "Uber Ride",
                amount: "-$20.20",
                date: "Jun 4"
            ),
        ]
        
        var filteredTransactions: [TransactionItem] {

            if searchText.isEmpty {
                return transactions
            }

            return transactions.filter {
                $0.categoryName.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        VStack(spacing: 0) {
            
            HStack() {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .foregroundStyle(.gray.opacity(0.5))
                        .frame(width: 20.0, height: 20.0)
                    
                    TextField("Search Transactions", text: $searchText)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "slider.horizontal.3")
                        .font(.title2)
                        .foregroundStyle(.gray)
                        .frame(width: 54.0, height: 54.0)
                        .background(.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 18.0))
                }
            }
            
            .padding()
            .background(.white)
            
            ScrollView {
                VStack(spacing: 20.0) {
                    ForEach(filteredTransactions, id: \.categoryName) { item in
                        TransactionItemRow(item: item)
                    }
                }
                .padding(20.0)
            }
            .scrollIndicators(.hidden)
            
        }
        .background(.gray.opacity(0.1))
    }
}

#Preview {
    TransactionsView()
}
