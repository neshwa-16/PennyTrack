//
//  HomeView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 10/06/26.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        let items = [CardItems(cardTitle: "Income", cardAmount: "$4,200", titleColor: "green"),
                     CardItems(cardTitle: "Expenses", cardAmount: "$2,847", titleColor: "red"),
                     CardItems(cardTitle: "Savings", cardAmount: "$1,353", titleColor: "blue")]
        
        let categories = [
            CategoryRowItem(
                iconTheme: "purple",
                iconName: "cart",
                categoryName: "Shopping",
                amount: "$842.00"
            ),
            CategoryRowItem(
                iconTheme: "orange",
                iconName: "fork.knife",
                categoryName: "Food & Dining",
                amount: "$675.50"
            ),
            CategoryRowItem(
                iconTheme: "blue", iconName: "car.side",
                categoryName: "Transportation",
                amount: "$423.75"
            ),
            CategoryRowItem(
                iconTheme: "green", iconName: "house",
                categoryName: "Bills",
                amount: "$550.75"
            ),
            CategoryRowItem(
                iconTheme: "pink", iconName: "bolt",
                categoryName: "Others",
                amount: "$350.75"
            )
        ]
        
        let transactions = [
            TransactionItem(
                iconTheme: "purple",
                iconName: "cart",
                categoryName: "Grocery Store",
                amount: "-$85.20",
                date: "Today"
            ),
            TransactionItem(
                iconTheme: "orange",
                iconName: "fork.knife",
                categoryName: "Restaurant",
                amount: "-$42.50",
                date: "Yesterday"
            ),
            TransactionItem(
                iconTheme: "blue",
                iconName: "car.side",
                categoryName: "Gas Station",
                amount: "-$65.00",
                date: "June 7"
            ),
        ]
        
        ZStack(alignment: .bottomTrailing) {
            
            //MARK: Scrollview
            ScrollView() {
                VStack(alignment: .leading, spacing: 5.0) {
                    Text("Good Morning,")
                        .foregroundStyle(.purple)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 18.0, weight: .semibold))
                    
                    Text("Sarah")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 32.0, weight: .semibold))
                    
                    Spacer()
                        .frame(height: 20.0)
                    
                    //MARK: Cardview
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 28.0)
                            .fill(
                                LinearGradient(
                                    colors: [.pink, .purple],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing)
                            )
                            .frame(height: 220.0)
                            .shadow(radius: 4.0)
                        
                        VStack(alignment: .leading ,spacing: 20.0) {
                            
                            VStack(alignment: .leading ,spacing: 7.0) {
                                Text("Total Spending This Month")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 15.0, weight: .medium))
                                
                                Text("$2,847.50")
                                    .font(.system(size: 32.0, weight: .bold))
                                    .foregroundStyle(.white)
                            }
                            
                            HStack (spacing: 25.0) {
                                VStack(alignment: .leading, spacing: 7.0) {
                                    Text("Budget")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 15.0, weight: .medium))
                                    
                                    Text("$3,500")
                                        .font(.system(size: 25.0, weight: .medium))
                                        .foregroundStyle(.white)
                                }
                                
                                VStack(alignment: .leading, spacing: 7.0) {
                                    Text("Remaining")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 15.0, weight: .medium))
                                    
                                    Text("$652.50")
                                        .font(.system(size: 25.0, weight: .medium))
                                        .foregroundStyle(.white)
                                }
                            }
                            
                        }
                        .padding(25.0)
                    }
                    
                    Spacer()
                        .frame(height: 20.0)
                    
                    //MARK: Grid cards
                    LazyVGrid(
                        columns:
                            Array(repeating: GridItem(.flexible(), spacing: 12), count: 3),
                        spacing: 12
                    ) {
                        ForEach(items) { item in
                            CardView(item: item)
                        }
                    }
                    
                    Spacer()
                        .frame(height: 20.0)
                    
                    Text("Spending by Category")
                        .foregroundStyle(.black)
                        .font(.system(size: 20.0, weight: .semibold))
                    
                    Spacer()
                        .frame(height: 20.0)
                    
                    //MARK: List by category
                    VStack {
                        ForEach(categories, id: \.categoryName) { item in
                            CategoryRow(item: item)
                        }
                    }
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    .shadow(
                        color: .black.opacity(0.1),
                        radius: 4.0,
                        x: 0,
                        y: 1
                    )
                    
                    Spacer()
                        .frame(height: 20.0)
                    
                    Text("Recent Transactions")
                        .foregroundStyle(.black)
                        .font(.system(size: 20.0, weight: .semibold))
                    
                    Spacer()
                        .frame(height: 20.0)
                    
                    //MARK: Recent transactions
                    VStack {
                        ForEach(transactions,  id: \.categoryName) { item in
                            TransactionRow(item: item)
                        }
                    }
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    .shadow(
                        color: .black.opacity(0.1),
                        radius: 4.0,
                        x: 0,
                        y: 1
                    )
                }
                .padding(25.0)
            }
            .scrollIndicators(.hidden)
            
            //MARK: Floating Button
            Button {
                
            } label: {
                Image(systemName: "plus")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .frame(width: 65.0, height: 65.0)
                    .background(
                        LinearGradient(
                            colors: [.pink, .purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
                    .clipShape(Circle())
                    .shadow(radius: 4.0)
            }
            .padding(.trailing, 20)
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    HomeView()
}
