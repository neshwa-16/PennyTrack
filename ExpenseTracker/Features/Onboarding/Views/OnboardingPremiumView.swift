//
//  OnboardingContainerView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 09/06/26.
//

import SwiftUI

struct OnboardingPremiumView: View {
    
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 32.0)
                .fill(
                    LinearGradient(
                        colors: [.yellow.opacity(0.5), .orange.opacity(0.5)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                )
                .frame(height: 300.0)
                .padding(.horizontal, 24.0)
            
            Spacer()
                .frame(height: 40.0)
            
            Text("Unlock advanced insights")
                .multilineTextAlignment(.center)
                .font(.system(size: 32.0, weight: .bold))
                .padding(.horizontal, 40.0)
                .foregroundStyle(.black)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
                .frame(height: 24.0)
            
            Text("Get premium analytics, custom reports, and export your data anytime")
                .multilineTextAlignment(.center)
                .font(.system(size: 18.0))
                .padding(.horizontal, 40.0)
                .foregroundStyle(.gray)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
                .frame(height: 40.0)
            
            HStack(spacing:10) {
                Circle()
                    .fill(.orange.opacity(0.3))
                    .frame(width: 12, height: 12)
                
                Circle()
                    .fill(.orange.opacity(0.3))
                    .frame(width: 12, height: 12)
                
                Capsule()
                    .fill(
                        LinearGradient(
                            colors: [.yellow, .orange],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
                    .frame(width: 50, height: 10)
            }
            
            Spacer()
                .frame(height: 40.0)
            
            Button {
                
            } label: {
                Text("Get Started")
                    .font(.system(size: 24.0, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 72.0)
                    .background(
                        LinearGradient(
                            colors: [.yellow, .orange],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: 28.0)
                    )
            }
            .padding(.horizontal, 28.0)
            .padding(.bottom, 30.0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.orange.opacity(0.1))
    }
}

#Preview {
    OnboardingPremiumView()
}
