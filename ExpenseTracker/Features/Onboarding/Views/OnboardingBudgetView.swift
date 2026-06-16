//
//  OnboardingBudgetView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 09/06/26.
//

import SwiftUI

struct OnboardingBudgetView: View {
    
    var body: some View {
        
        @State var currentPage = 0
        
        VStack {
            RoundedRectangle(cornerRadius: 32.0)
                .fill(.green.opacity(0.2))
                .frame(height: 300.0)
                .padding(.horizontal, 24)
            
            Spacer()
                .frame(height: 40.0)
            
            Text("Stay on budget")
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40.0)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
                .frame(height: 24.0)
            
            Text("Set monthly budgets and get alerts when you're close to your limits")
                .font(.system(size: 18.0))
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40.0)
                .fixedSize(horizontal: false, vertical: true)
            
            //PageIndicator(pageCount: 3, currentPage: $currentPage)
            
            Spacer()
                .frame(height: 24.0)
            
            HStack(spacing: 10) {
                Circle()
                    .fill(.green.opacity(0.3))
                    .frame(width: 12, height: 12)
                
                Capsule()
                    .fill(.green)
                    .frame(width: 50, height: 10)
                
                Circle()
                    .fill(.green.opacity(0.3))
                    .frame(width: 12, height: 12)
            }
            
            Spacer()
                .frame(height: 40.0)
            
            Button {
                
            } label: {
                Text("Continue")
                    .font(.system(size: 24.0, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(height: 72.0)
                    .frame(maxWidth: .infinity)
                    .background(.green)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 28.0)
                    )
            }
            .padding(.horizontal, 24.0)
            .padding(.bottom, 30.0)
        }
        //.frame(width: 600.0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green.opacity(0.05))
       
        
    }
    
}

#Preview {
    OnboardingBudgetView()
}
