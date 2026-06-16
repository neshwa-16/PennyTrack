//
//  AnalyticsView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 15/06/26.
//

import SwiftUI

struct AnalyticsView: View {
    
    var body: some View {
       
        ScrollView {
            VStack {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(.white)
                        .frame(height: 300.0)
                    
                    VStack(alignment: .leading, spacing: 15.0) {
                        Text("Spending Trend")
                            .font(.system(size: 20.0, weight: .bold))
                    }
                    .padding(20.0)
                }
                
            }
        }
        .padding(20.0)
        .background(.blue.opacity(0.02))
    }
}

#Preview {
    AnalyticsView()
}
