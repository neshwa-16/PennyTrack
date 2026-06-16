//
//  RootView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 10/06/26.
//

import SwiftUI

struct RootView : View {
    
    @AppStorage("hasCompletedOnboarding")
    private var hasCompletedOnboarding = false
    
    var body: some View {
        
        if hasCompletedOnboarding {
            ContainerView()
        } else {
            OnboardingContainerView()
        }
    }
}
