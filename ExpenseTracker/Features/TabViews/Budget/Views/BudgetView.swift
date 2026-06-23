//
//  BudgetView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 15/06/26.
//

import SwiftUI

struct BudgetView: View {
    
    let budgets = [
        BudgetRowItem(
            iconTheme: "purple",
            iconName: "cart",
            categoryName: "Whole Foods Market",
            amount: "-$12.50",
            percentage: 110.0
        ),
        BudgetRowItem(
            iconTheme: "orange",
            iconName: "fork.knife",
            categoryName: "Starbucks Coffee",
            amount: "+$4,200.00",
            percentage: 90.0
        ),
        BudgetRowItem(
            iconTheme: "green",
            iconName: "house",
            categoryName: "Monthly Salary",
            amount: "-$42.50",
            percentage: 15.0
        ),
        BudgetRowItem(
            iconTheme: "orange",
            iconName: "fork.knife",
            categoryName: "Italian Restaurant",
            amount: "-$65.0",
            percentage: 45.0
        ),
        BudgetRowItem(
            iconTheme: "blue",
            iconName: "car.side",
            categoryName: "Shell Gas Stationt",
            amount: "-$125.00",
            percentage: 55.0
        ),
        BudgetRowItem(
            iconTheme: "green",
            iconName: "house",
            categoryName: "Electric Bill",
            amount: "-$89.99",
            percentage: 65.0
        ),
        BudgetRowItem(
            iconTheme: "purple",
            iconName: "cart",
            categoryName: "Amazon Purchase",
            amount: "-$18.50",
            percentage: 22.0
        ),
        BudgetRowItem(
            iconTheme: "blue",
            iconName: "car.side",
            categoryName: "Uber Ride",
            amount: "-$20.20",
            percentage: 72.0
        ),
        BudgetRowItem(
            iconTheme: "green",
            iconName: "house",
            categoryName: "Electric Bill",
            amount: "-$89.99",
            percentage: 87.0
        ),
        BudgetRowItem(
            iconTheme: "purple",
            iconName: "cart",
            categoryName: "Amazon Purchase",
            amount: "-$18.50",
            percentage: 54.0
        ),
        BudgetRowItem(
            iconTheme: "blue",
            iconName: "car.side",
            categoryName: "Uber Ride",
            amount: "-$20.20",
            percentage: 33.80
        ),
        BudgetRowItem(
            iconTheme: "green",
            iconName: "house",
            categoryName: "Electric Bill",
            amount: "-$89.99",
            percentage: 20.0
        ),
        BudgetRowItem(
            iconTheme: "purple",
            iconName: "cart",
            categoryName: "Amazon Purchase",
            amount: "-$18.50",
            percentage: 8.0
        ),
        BudgetRowItem(
            iconTheme: "blue",
            iconName: "car.side",
            categoryName: "Uber Ride",
            amount: "-$20.20",
            percentage: 80.0
        ),
    ]
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(
                            LinearGradient(
                                colors: [.pink, .purple],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
                        )
                        .frame(height: 220.0)
                        .padding(.vertical, 15.0)
                    
                    VStack(alignment: .leading, spacing: 15.0) {
                        Text("Monthly Budget")
                        
                        Text("$3,500")
                            .font(.system(size: 32.0))
                        
                        HStack {
                            Text("Spent")
                            Spacer()
                            Text("$2,847.50")
                        }
                        
                        ProgressView(value: 0.9)
                            .tint(.white)
                        
                        Text("$652.50 remaining • 81% used")
                    }
                    .foregroundStyle(.white)
                    .padding(15.0)
                }
                
                Text("Category Budgets")
                    .font(.system(size: 20.0, weight: .bold))
            }
            .padding()
            
            VStack(spacing: 20) {
                ForEach(budgets, id: \.id) { budget in
                    BudgetRow(item: budget)
                }
            }
            .padding(.horizontal, 20.0)
            .padding(.bottom, 30.0)
            
        }
        .background(.blue.opacity(0.02))
        .scrollIndicators(.hidden)
    }
}

#Preview {
    BudgetView()
}
