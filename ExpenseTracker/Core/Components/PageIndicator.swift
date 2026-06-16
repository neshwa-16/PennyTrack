//
//  PageIndicator.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 09/06/26.
//

import SwiftUI

struct PageIndicator : View {
    
    let pageCount: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<pageCount, id: \.self) { index in
                Button {
                    withAnimation(.easeInOut) {
                        currentPage = index
                    }
                } label: {
                    if index == currentPage {
                        Capsule()
                            .fill(.purple)
                            .frame(width: 50, height: 10)
                    } else {
                        Circle()
                            .fill(.purple.opacity(0.3))
                            .frame(width: 12, height: 12)
                    }
                }
                .buttonStyle(.plain)
            }
        }
    }
}


