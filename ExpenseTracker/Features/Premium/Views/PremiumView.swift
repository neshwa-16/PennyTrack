//
//  PremiumView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 20/06/26.
//

import SwiftUI
import StoreKit

struct PremiumView: View {
    
    @EnvironmentObject private var appState: AppState
    @State private var isLoading = true
    
    var body: some View {
        
        Group {
            if isLoading {
                ProgressView("Loading Products...")
            } else {
                PremiumContent
            }
        }
        .task {
            await appState.purchaseManager.loadProducts()
            await appState.entitlementManager.refreshEntitlements()

            isLoading = false
        }
    }
    
    private var PremiumContent: some View {
                ScrollView {
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

                   PremiumFeaturesCard()
                   
                   VStack (spacing: 20){
                           ForEach(appState.purchaseManager.products, id: \.id) { product in
                               
                               Button {
                                   print("Tapped: \(product.id)")
                                   Task {
                                       do {
                                           try await appState.purchaseManager.purchase(product)
                                       } catch {
                                           print(error.localizedDescription)
                                       }
                                   }
                               } label: {
                                   HStack {

                                       VStack(alignment: .leading, spacing: 4) {

                                           Text(product.displayName)
                                               .font(.headline)
                                               .foregroundStyle(.black)

                                           Text(product.description)
                                               .font(.subheadline)
                                               .foregroundStyle(.gray)
                                       }

                                       Spacer()

                                       Text(product.displayPrice)
                                           .font(.title3)
                                           .fontWeight(.semibold)
                                           .foregroundStyle(.black)
                                   }
                                   .padding()
                                   .frame(maxWidth: .infinity)
                                   .frame(height: 120)
                                   .background(
                                       RoundedRectangle(cornerRadius: 20)
                                           .fill(.white)
                                   )
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 20)
                                           .stroke(.purple, lineWidth: 2)
                                   )
                               }
                               .buttonStyle(.plain)
                           }
                   }
               }
               .padding(25)
           }
           .scrollIndicators(.hidden)
           .task {
               await appState
                   .purchaseManager.loadProducts()
               
               print("Products count: \(appState.purchaseManager.products.count)")
               
               await appState
                   .entitlementManager
                   .refreshEntitlements()
           }
          }
}

#Preview {
    PremiumView()
}
