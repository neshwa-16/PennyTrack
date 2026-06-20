//
//  ContainerView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 12/06/26.
//

import SwiftUI

struct ContainerView: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            Tab("Home", systemImage: "house", value: 0) {
                    HomeView()
                }
            
            Tab("Transactions", systemImage: "dollarsign.square", value: 1) {
                    TransactionsView()
                }
            
            Tab("Budget", systemImage: "chart.pie", value: 2) {
                    BudgetView()
                }
            
            Tab("Analytics", systemImage: "chart.bar.xaxis", value: 3) {
                    AnalyticsView()
                }
            
            Tab("Settings", systemImage: "gearshape", value: 4) {
                    SettingsView()
                }
        }
        .tint(.purple)
        
    }
}

#Preview {
    ContainerView()
}
