//
//  BarChartView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 15/06/26.
//

import SwiftUI
import SwiftUI
import Charts

struct Expense: Identifiable {
    let id = UUID()
    let month: String
    let amount: Double
}

struct BarChartView: View {

    let data = [
        Expense(month: "Jan", amount: 2200),
        Expense(month: "Feb", amount: 3800),
        Expense(month: "Mar", amount: 4500),
        Expense(month: "Apr", amount: 2480),
        Expense(month: "May", amount: 2090),
        Expense(month: "Jun", amount: 3550),
        Expense(month: "Jul", amount: 2924),
        Expense(month: "Aug", amount: 3534),
        Expense(month: "Sep", amount: 3454),
        Expense(month: "Oct", amount: 4561),
        Expense(month: "Nov", amount: 5897),
        Expense(month: "Dec", amount: 5671)
    ]

    @State private var selectedExpense: Expense?
    @State private var tooltipPosition: CGPoint = .zero

    var body: some View {

        ZStack {

            RoundedRectangle(cornerRadius: 20)
                .fill(.purple.opacity(0.1))

            Chart(data) { expense in

                BarMark(
                    x: .value("Month", expense.month),
                    y: .value("Amount", expense.amount)
                )
                .foregroundStyle(.purple)
            }
            .chartScrollableAxes(.horizontal)
            .chartXVisibleDomain(length: 5)
            .chartYAxis(.hidden)
            .chartXAxis {
                AxisMarks { _ in
                    AxisValueLabel()
                }
            }
            .chartOverlay { proxy in

                GeometryReader { geometry in

                    Rectangle()
                        .fill(.clear)
                        .contentShape(Rectangle())
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in

                                    let location = value.location

                                    guard let month: String =
                                        proxy.value(atX: location.x)
                                    else { return }

                                    guard let expense =
                                        data.first(where: {
                                            $0.month == month
                                        })
                                    else { return }

                                    selectedExpense = expense

                                    if let xPos =
                                        proxy.position(forX: month) {

                                        tooltipPosition = CGPoint(
                                            x: xPos,
                                            y: location.y
                                        )
                                    }
                                }
                                .onEnded { _ in
                                    selectedExpense = nil
                                }
                        )
                }
            }

            if let expense = selectedExpense {

                VStack(spacing: 4) {

                    Text(expense.month)
                        .font(.caption)

                    Text("₹\(Int(expense.amount))")
                        .font(.headline)
                }
                .padding(10)
                .background(.white)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
                .shadow(radius: 4)
                .position(
                    x: tooltipPosition.x,
                    y: 40
                )
            }
        }
        .frame(height: 300)
        .padding()
    }
}

#Preview {
    BarChartView()
}
