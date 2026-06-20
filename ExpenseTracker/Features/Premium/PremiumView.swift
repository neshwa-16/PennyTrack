//
//  PremiumView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 20/06/26.
//

import SwiftUI

struct PremiumView: View {
    var body: some View {
        
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [.yellow.opacity(0.2), .orange.opacity(0.2)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                )
                .frame(height: 220)
            
            Text("Unlock Premium Features")
                .font(.system(size: 24, weight: .semibold))
            
            Text("Get the most out of your expense tracking with advanced tools")
                .foregroundStyle(.gray.opacity(0.7))
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 25))
                        .background(.orange)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                    
                    Text("Advanced Analytics & Insights")
                }
                
                HStack {
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 25))
                        .background(.orange)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                    
                    Text("Advanced Analytics & Insights")
                }
                
                HStack {
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 25))
                        .background(.orange)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                    
                    Text("Advanced Analytics & Insights")
                }
                
                HStack {
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 25))
                        .background(.orange)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                    
                    Text("Advanced Analytics & Insights")
                }
                
                HStack {
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 25))
                        .background(.orange)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                    
                    Text("Advanced Analytics & Insights")
                }
                
                HStack {
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 25))
                        .background(.orange)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                    
                    Text("Advanced Analytics & Insights")
                }
            }
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            //.padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            colors: [.yellow.opacity(0.2), .orange.opacity(0.2)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
            )
           

        }
        .padding()
    }
}

#Preview {
    PremiumView()
}
