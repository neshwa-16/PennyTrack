//
//  AppState.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 10/06/26.
//

import Combine

final class AppState: ObservableObject {

    @Published var hasCompletedOnboarding = false
    @Published var isLoggedIn = false
    @Published var isPremium = false
}
