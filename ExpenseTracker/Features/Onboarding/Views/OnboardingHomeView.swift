//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 09/06/26.
//

import SwiftUI
import CoreData

struct OnboardingHomeView: View {
    
    let page: OnboardingPage
    let pageCount: Int
    @AppStorage("hasCompletedOnboarding")
    private var hasCompletedOnboarding = false
    @Binding var currentPage : Int

    var body: some View {
        GeometryReader { geometry in
            
            
            let width = geometry.size.width
            //let height = geometry.size.height
            @Environment(\.horizontalSizeClass) var horizontalSizeClass
            
            VStack {
                
                Spacer()
                    .frame(height: 40.0)
                
                //MARK: Logo
                RoundedRectangle(cornerRadius: 30.0)
                    .fill(
                        LinearGradient(
                            colors: [
                                page.gradientColors[0],
                                page.gradientColors[1]
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
                    .frame(width: width * 0.25, height: width * 0.25)
                    .overlay{
                        Image(systemName: "wallet.pass")
                            .font(.system(size: 40))
                            .foregroundStyle(.white)
                    }
                
                Spacer()
                    .frame(height: 40.0)
                
                //MARK: Illustration
                ZStack {
                    RoundedRectangle(cornerRadius: 32.0)
                        .fill(
                            LinearGradient(
                                colors: [page.gradientColors[0], page.gradientColors[1]],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
                        )
                        .frame(height: 200.0)
                }
                .padding(.horizontal, 24.0)
                
                Spacer()
                    .frame(height: 40.0)
                
                //MARK: Title
                Text(page.title)
                    .font(.system(size: 32.0, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black)
                    .padding(.horizontal, 40.0)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                    .frame(height: 24.0)
                
                Text(page.subtitle)
                    .font(.system(size: 18.0))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.gray)
                    .padding(.horizontal, 40.0)
                    .fixedSize(horizontal: false, vertical: true)

                
                Spacer()
                    .frame(height: 40)
                
                //MARK: Page Indicator
                //PageIndicator(pageCount: 3, currentPage: $currentPage)
                
                HStack(spacing: 10) {
                    Capsule()
                        .fill(page.gradientColors[0])
                        .frame(width: 50, height: 10)
                    
                    Circle()
                        .fill(page.gradientColors[0].opacity(0.3))
                        .frame(width: 12, height: 12)
                    
                    Circle()
                        .fill(page.gradientColors[0].opacity(0.3))
                        .frame(width: 12, height: 12)
                }
                
                Spacer()
                    .frame(height: 40)
                
                Button {
                    if currentPage < pageCount - 1 {
                        withAnimation {
                            currentPage += 1
                        }
                    } else {
                        currentPage = 0
                        hasCompletedOnboarding = true
                        //
                    }
                } label: {
                    Text(currentPage == 3
                         ? "Get Started"
                         : "Continue")
                        .font(.system(size: 24.0, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 72.0)
                        .background(
                            LinearGradient(
                                colors: [page.gradientColors[0], page.gradientColors[1]],
                                startPoint: .leading,
                                endPoint: .trailing)
                        )
                        .clipShape(
                            RoundedRectangle(cornerRadius: 28.0)
                        )
                }
                .padding(.horizontal, 24.0)
                .padding(.bottom, 34.0)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
}


//#Preview {
//    OnboardingHomeView(page: <#OnboardingPage#>).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//}
