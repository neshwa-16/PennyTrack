//
//  CategoryButton.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 23/06/26.
//

import SwiftUI
import SwiftData

struct CategoryButtons: View {
    
    @Binding var selectedCategory: Category?
    
    @Query(sort: \Category.name) private var categories: [Category]
    @Query private var expenses: [Expense]
    
    var body: some View {
        
        HStack (spacing: 5) {
            ForEach(categories) { category in
                Button {
                    selectedCategory = category
                } label: {
                    VStack(spacing: 8) {
                        Image(systemName: category.icon)
                            .font(.system(size: 24))
                            .foregroundStyle(Color(hex: category.iconTheme))
                            .frame(width: 56, height: 56)
                            .background(
                                selectedCategory?.persistentModelID == category.persistentModelID
                                ? Color(hex: category.iconTheme).opacity(0.5)
                                : Color(hex: category.iconTheme).opacity(0.1)
                            )
                            .clipShape(
                                RoundedRectangle(cornerRadius: 18)
                            )
                        
                        Text(category.name)
                            .foregroundStyle(.black)
                            .font(.system(size: 12.0))
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .frame(maxWidth: .infinity)
                    }
                    .frame(width: 70)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 4)
    }
}

#Preview {
    //CategoryButtons()
}
