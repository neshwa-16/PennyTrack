//
//  PremiumFeaturesCard.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 22/06/26.
//

import SwiftUI

struct PremiumFeaturesCard: View {
    
    let features: [String] = ["Advanced Analytics & Insights", "Custom Budget Planning", "Export to PDF/CSV", "Unlimited Categories", "Priority Support", "Ad-free Experience"]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            ForEach(features, id: \.self) { feature in
                HStack(alignment: .center) {
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 25))
                        .background(.orange)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                    
                    Text(feature)
                }
                .padding(.leading, 20)
            }
        }
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [.yellow.opacity(0.2), .orange.opacity(0.2)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        )
    }
}

#Preview {
    PremiumFeaturesCard()
}
