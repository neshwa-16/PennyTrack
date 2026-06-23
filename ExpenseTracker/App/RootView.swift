//
//  RootView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 10/06/26.
//

import SwiftUI
import SwiftData

struct RootView : View {
    
    @AppStorage("hasCompletedOnboarding")
    private var hasCompletedOnboarding = false
    @Environment(\.modelContext) private var context
    
    @State private var viewModel = AddExpenseViewModel()
    
    var body: some View {
        
        Group {
            if hasCompletedOnboarding {
                ContainerView()
            } else {
                OnboardingContainerView()
            }
        }
        .task {
            let repository = CategoryRepository(context: context)
            try? repository.seedDefaultCategories()
        }
    }
}
