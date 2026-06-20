//
//  SettingsRow.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 17/06/26.
//

import SwiftUI

struct SettingsRow: View {
    
    let item : SettingsItem
    
    var body: some View {
        
        HStack(spacing: 20.0) {
            Image(systemName: item.iconName)
                .font(.system(size: 24.0))
                .frame(width: 56.0, height: 56.0)
                .foregroundStyle(Color(item.iconTheme))
                .background(Color(item.iconTheme).opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 20.0))
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(item.titleText)
                    .font(.system(size: 15.0, weight: .semibold))
                
                Text(item.subTitle)
                    .font(.system(size: 13.0))
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
        .background(.white)
    }
}

#Preview {
    SettingsRow(
        item:
            SettingsItem(
                titleText: "Profile",
                iconName: "person",
                subTitle: "Sarah Johnson",
                iconTheme: "purple"
            ))
}
