//
//  BarChartView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 15/06/26.
//

import SwiftUI
import Charts

struct BarChartView: View {

    let data = [
        ExpenseMonth(month: "Jan", amount: 2200),
        ExpenseMonth(month: "Feb", amount: 3800),
        ExpenseMonth(month: "Mar", amount: 4500),
        ExpenseMonth(month: "Apr", amount: 2480),
        ExpenseMonth(month: "May", amount: 2090),
        ExpenseMonth(month: "Jun", amount: 3550),
        ExpenseMonth(month: "Jul", amount: 2924),
        ExpenseMonth(month: "Aug", amount: 3534),
        ExpenseMonth(month: "Sep", amount: 3454),
        ExpenseMonth(month: "Oct", amount: 4561),
        ExpenseMonth(month: "Nov", amount: 5897),
        ExpenseMonth(month: "Dec", amount: 5671)
    ]

    var selectedExpense: ExpenseMonth? {
        guard let selectedMonth else { return nil }

        return data.first {
            $0.month == selectedMonth
        }
    }
    
    @State private var selectedMonth: String?
    @State private var tooltipPosition: CGPoint = .zero

    var body: some View {
        
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Spending Trend")
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.top, 20)
                    .padding(.leading, 20)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue.opacity(0.05))
                    .frame(height: 320)
                    .overlay {
                        Chart(data) { expense in
                            BarMark(
                                x: .value("Month", expense.month),
                                y: .value("Amount", expense.amount),
                                width: 40.0
                            )
                            .cornerRadius(12.0)
                            .foregroundStyle(
                                selectedMonth == expense.month ? .blue.opacity(0.5) : .blue
                            )
                            
                            if let selectedMonth, selectedMonth == expense.month {
                                
                                RuleMark(
                                    x: .value("Month", expense.month)
                                )
                                .foregroundStyle(.clear)
                                .annotation(
                                    position: .top,
                                    overflowResolution: .init(
                                        x: .fit(to: .chart),
                                        y: .fit(to: .chart)
                                    )
                                ) {
                                    VStack {
                                        Text(expense.month)
                                        Text("$\(expense.amount, specifier: "%.0f")")
                                    }
                                    .padding(10)
                                    .frame(width: 120, height: 75)
                                    .background(.white)
                                    .shadow(radius: 4.0)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                }                        }
                        }
                        .padding(10)
                        .chartXVisibleDomain(length: 5)
                        .chartScrollableAxes(.horizontal)
                        .chartYAxis(.hidden)
                        .chartXAxis {
                            AxisMarks { _ in
                                AxisValueLabel()
                            }
                        }
                        .chartXSelection(value: $selectedMonth)
                    }
                    .padding(20.0)
            }
        }
        .padding(15)
        .frame(height: 400)
        .background(RoundedRectangle(cornerRadius: 20).fill(.white))
        
       
        
        /* Chart(data) { expense in
            
//            if let selectedMonth {
//                RuleMark(
//                    x: .value("Month", selectedExpense?.month ?? "")
//                )
//                .foregroundStyle(.secondary.opacity(0.3))
//                .annotation(
//                    position: .overlay,
//                    overflowResolution: .init(
//                        x: .fit(to: .chart),
//                        y: .disabled
//                    ),
//                    content: {
//                        VStack {
//                            Text(selectedExpense?.month ?? "")
//                            Text("$\(Int(selectedExpense?.amount ?? 0.0))")
//                        }
//                        .padding(10.0)
//                        .frame(width: 120)
//                        .background(RoundedRectangle(cornerRadius: 12.0).fill(.white))
//                    })
//            }
            
            BarMark(
                x: .value("Month", expense.month),
                y: .value("Amount", expense.amount),
            )
            .foregroundStyle(.purple)
            .cornerRadius(12.0)
            .opacity((selectedMonth == nil) || (expense.month == selectedExpense?.month) ? 1.0 : 0.3)
        }
        .chartScrollableAxes(.horizontal)
        .chartXVisibleDomain(length: 5)
        .chartYAxis(.hidden)
        .chartXSelection(value: $selectedMonth.animation(.easeInOut))
//            .onChange(of: selectedExpense, { oldValue, newValue in
//                print(newValue?.amount ?? 0.0)
//            })
        .chartXAxis {
            AxisMarks { _ in
                AxisValueLabel()
            }
        }
        .chartLegend(.visible)
        .chartForegroundStyleScale([
            "Month": .red,
            "Travel": .green,
            "Bills": .blue
        ])
        .chartPlotStyle { plotArea in
            plotArea
                .background(.red.opacity(0.1))
        }
        .chartOverlay { proxy in
            GeometryReader { geo in
                Rectangle()
                    .fill(.clear)
                    .contentShape(Rectangle())
                    .gesture(
                        DragGesture()
                    )
            }
        }
        .chartBackground {_ in 
            Color.gray.opacity(0.1)
        } */
       
    }
}

#Preview {
    BarChartView()
}


/* .chartOverlay { proxy in

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
} */
 
