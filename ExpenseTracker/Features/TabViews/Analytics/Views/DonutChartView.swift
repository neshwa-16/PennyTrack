//
//  DonutChartView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 19/06/26.
//

import SwiftUI
import Charts

struct DonutChartView: View {
    
    let expenses : [ExpenseCategory] = [
        ExpenseCategory(category: "Shopping", amount: 3490.0),
        ExpenseCategory(category: "Food", amount: 5490.0),
        ExpenseCategory(category: "Transport", amount: 1490.0),
    ]
    
    @State private var selectedAngle: Double?
    
    var selectedCategory: ExpenseCategory? {
        guard let selectedAngle else { return nil }

        var total = 0.0

        for item in expenses {
            total += item.amount

            if selectedAngle <= total {
                return item
            }
        }

        return nil
    }
    
    var body: some View {
       
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Category Distribution")
                    .font(.system(size: 18, weight: .semibold))
                    .padding(15)
                
                /* ZStack(alignment: .center) {
                    VStack() {
                        if let selectedCategory {
                            Text(selectedCategory.category)
                                .font(.headline)

                            Text("$\(selectedCategory.amount, specifier: "%.0f")")
                                .font(.title3.bold())
                        } else {
                            Text("Total")
                                .foregroundStyle(.gray)
                                .font(.headline)

                            Text("$\(expenses.reduce(0) { $0 + $1.amount }, specifier: "%.0f")")
                                .font(.title3.bold())
                        }
                    }
                    
                    Chart(expenses) { item in
                        SectorMark(
                            angle: .value("Amount", item.amount),
                            innerRadius: .ratio(0.75),
                            angularInset: 2
                        )
                        .foregroundStyle(by: .value("Category", item.category))
                        .opacity(selectedCategory?.category == item.category ? 0.5 : 1)
                        .cornerRadius(20.0)
                    }
                    .padding()
                    .chartAngleSelection(value: $selectedAngle)
                } */
                
                ZStack {

                    Chart(expenses) { item in
                        SectorMark(
                            angle: .value("Amount", item.amount),
                            innerRadius: .ratio(0.75),
                            angularInset: 2
                        )
                        .foregroundStyle(by: .value("Category", item.category))
                        .opacity(selectedCategory?.category == item.category ? 0.5 : 1)
//                        .cornerRadius(7.0)
                    }
                    .padding()
                    .chartAngleSelection(value: $selectedAngle)

                    VStack(spacing: 4) {

                        if let selectedCategory {

                            Text(selectedCategory.category)
                                .font(.caption)
                                .foregroundStyle(.secondary)

                            Text("$\(selectedCategory.amount, specifier: "%.0f")")
                                .font(.title2.bold())

                        } else {
                            
                            let total = expenses.reduce(0) { result, expense in
                                result + expense.amount
                            }

                            Text("Total")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)

                            Text("$\(total, specifier: "%.0f")")
                                .font(.title2.bold())
                        }
                    }
                }
            }
        }
        .padding()
        .frame(height: 400)
        .background(RoundedRectangle(cornerRadius: 20).fill(.white))
    }
}

#Preview {
    DonutChartView()
}
