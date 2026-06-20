//
//  AddExpenseView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 18/06/26.
//

import SwiftUI

struct AddExpenseView: View {
    
    @State private var amount: String = ""
    @State private var notes = ""
    
    let categories : [CategoryModel] = [
        CategoryModel(
            categoryName: "Shopping",
            iconName: "cart",
            iconTheme: "purple"),
        CategoryModel(
            categoryName: "Food",
            iconName: "fork.knife",
            iconTheme: "orange"),
        CategoryModel(
            categoryName: "Transport",
            iconName: "car.side",
            iconTheme: "blue"),
        CategoryModel(
            categoryName: "Bills",
            iconName: "house",
            iconTheme: "green"),
        CategoryModel(
            categoryName: "Other",
            iconName: "bolt",
            iconTheme: "pink"),
    ]
    
    var body: some View {
        
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12.0) {
                    Text("Amount")
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                    
                    //MARK: Amount Textfield
                    HStack(spacing: 15.0) {
                        Text("$")
                            .foregroundStyle(.black)
                            .padding(.leading, 15.0)
                        
                        TextField("0.00", text: $amount)
                            .padding(.trailing, 15.0)
                    }
                    .font(.system(size: 28.0))
                    .frame(maxWidth: .infinity)
                    .frame(height: 65.0)
                    .background(.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 18.0))
                    
                    Spacer()
                        .frame(height: 5.0)
                    
                    Text("Category")
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                    
                    //MARK: Categories
                    HStack (alignment: .top){
                        ForEach(categories, id: \.categoryName) { category in
                            VStack(spacing: 8.0) {
                                Image(systemName: category.iconName)
                                    .font(.system(size: 24.0))
                                .foregroundStyle(Color(category.iconTheme))
                                    .frame(width: 56.0, height: 56.0)
                                    .background(
                                        RoundedRectangle(cornerRadius: 18)
                                            .fill(Color(category.iconTheme).opacity(0.1))
                                    )
                                    .frame(maxWidth: .infinity)
                                
                                Text(category.categoryName)
                                    .font(.system(size: 12.0, weight: .medium))
                            }
                        }
                    }
                    
                    Spacer()
                        .frame(height: 5.0)
                    
                    Text("Date")
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                    
                    //MARK: Date Picker
                    HStack {
                        Text("Today")
                            .font(.system(size: 23.0, weight: .medium))
                            .padding(.leading, 15.0)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 20.0, height: 20.0)
                                .foregroundStyle(.gray.opacity(0.7))
                                .padding(.trailing, 15.0)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 65.0)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(.gray.opacity(0.1))
                    )
                    
                    Spacer()
                        .frame(height: 5.0)
                    
                    Text("Notes (Optional)")
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                    
                    //MARK: Notes
                    ZStack(alignment: .topLeading) {
                        
                        if notes.isEmpty {
                            Text("Add a note...")
                                .foregroundStyle(.secondary)
                                .padding(.top, 8)
                                .padding(.leading, 5)
                        }
                        
                        TextEditor(text: $notes)
                            .scrollContentBackground(.hidden)
                            .background(.clear)
                    }
                    .font(.system(size: 18))
                    .frame(height: 100)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color.gray.opacity(0.1))
                    )
                    
                    Spacer()
                        .frame(height: 10.0)
                    
                    Text("Payment Method")
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                    
                    //MARK: Payment Method
                    HStack(spacing: 15) {
                        Image(systemName: "creditcard")
                            .resizable()
                            .frame(width: 20.0, height: 20.0)
                            .foregroundStyle(.gray)
                            .padding(.leading, 15.0)
                        
                        Text("Credit Card")
                            .font(.system(size: 20, weight: .medium))
                        
                        Spacer()
                        
                        Text("... 4532")
                            .font(.system(size: 18))
                            .foregroundStyle(.gray)
                            .padding(.trailing, 15.0)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 65.0)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(.gray.opacity(0.1))
                    )
                    
                    Spacer()
                }
                .padding(20)
            }
            .scrollIndicators(.hidden)
            
            Divider()
                .background(.gray.opacity(0.5))
            
            Button {
                
            } label: {
                Text("Save Expense")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 65)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(
                                LinearGradient(
                                    colors: [.pink, .purple],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing)
                            )
                    )
            }
            .padding(20)
        }
    }
}

#Preview {
    AddExpenseView()
}
