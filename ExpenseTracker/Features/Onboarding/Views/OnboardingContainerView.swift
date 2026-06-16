//
//  OnboardingContainerView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 10/06/26.
//

import SwiftUI

struct OnboardingContainerView: View {
    
    @State var currentPage = 0
    let pages : [OnboardingPage] = [
        .init(
            title: "Track every expense with ease",
            subtitle: "Take control of your finances",
            gradientColors: [.purple, .blue]
        ),
        .init(
            title: "Stay on budget",
            subtitle: "Monitor spending and savings",
            gradientColors: [.green, .gray]
        ),
        .init(
            title: "Unlock advanced insights",
            subtitle: "Premium analytics and exports",
            gradientColors: [.yellow, .orange]
        ),
    ]
    
    var body: some View {
        
        ZStack {

            pages[currentPage].gradientColors[0].opacity(0.1)
                .ignoresSafeArea()
            
            TabView(selection: $currentPage) {
                ForEach(Array(pages.enumerated()), id: \.offset) { index, page in
                    OnboardingHomeView(page: page, pageCount: pages.count, currentPage: $currentPage)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

#Preview {
    OnboardingContainerView()
}
