//
//  SettingsView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 17/06/26.
//

import SwiftUI

struct SettingsView: View {
    
    let settings : [SettingsItem] = [
        SettingsItem(
            titleText: "Profile",
            iconName: "person",
            subTitle: "Sarah Johnson",
            iconTheme: "purple"),
        SettingsItem(
            titleText: "Currency",
            iconName: "dollarsign",
            subTitle: "USD($)",
            iconTheme: "green"),
        SettingsItem(
            titleText: "Notifications",
            iconName: "bell",
            subTitle: "Enabled",
            iconTheme: "orange"),
        SettingsItem(
            titleText: "Export Data",
            iconName: "arrow.down.to.line.circle",
            subTitle: "Sarah Johnson",
            iconTheme: "purple"),
        SettingsItem(
            titleText: "Restore Purchases",
            iconName: "arrow.trianglehead.counterclockwise.rotate.90",
            subTitle: "",
            iconTheme: "red"),
        SettingsItem(
            titleText: "About",
            iconName: "info",
            subTitle: "V1.0.0",
            iconTheme: "blue"),
    ]
    
    var body: some View {
    
        ScrollView {
            VStack(alignment: .center, spacing: 20.0) {
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(
                            LinearGradient(
                                colors: [.pink, .purple],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
                        )
                        .frame(height: 160.0)
                    
                    HStack(spacing: 25.0) {
                        Circle()
                            .fill(.white)
                            .frame(width: 100, height: 100)
                            .overlay {
                                Image(systemName: "person")
                                    .font(.system(size: 50))
                                    .foregroundStyle(.purple)
                            }
                        
                        VStack(alignment: .leading, spacing: 5.0) {
                            Text("Sarah Johnson")
                            Text("sarah@\u{200B}email.com")
                        }
                        .foregroundColor(.white)
                        .font(.system(size: 17.0, weight: .bold))
                        
                        Spacer()
                    }
                    .padding(20.0)
                }
                
                Spacer()
                    .frame(height: 10.0)
                
                VStack(alignment: .leading, spacing: 30.0) {
                    ForEach(settings) { setting in
                        SettingsRow(item: setting)
                    }
                }
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                .shadow(color: .black.opacity(0.1),
                        radius: 3.0,
                        x: 1.0)
                
                Text("Expense Tracker")
                    .foregroundStyle(.gray)
                
                Text("Made with care for better financial management")
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            //.padding(.top, 50.0)
            .padding(20.0)
            .background(.blue.opacity(0.03))
        }
        .scrollIndicators(.hidden)
        .background(.blue.opacity(0.03))
    }
}

#Preview {
    SettingsView()
}
