//
//  AddExpenseView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 18/06/26.
//

import SwiftUI
import SwiftData

struct AddExpenseView: View {
    
    @State private var notes = ""
    
    @StateObject private var viewModel = AddExpenseViewModel()
    
    @State private var selectedDate = Date()
    @State private var showDatePicker = false
    
    @Environment(\.modelContext) private var context
    
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
                        
                        TextField("0.00", text: $viewModel.amount)
                            .padding(.trailing, 15.0)
                            .keyboardType(.decimalPad)
                            .onChange(of: viewModel.amount) { _, newValue in
                                viewModel.amount = AmountValidator.sanitize(newValue)
                            }
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
                    ScrollView(.horizontal, showsIndicators: false) {
                        CategoryButtons(selectedCategory: $viewModel.selectedCategory)
                    }
                    
                    Spacer()
                        .frame(height: 5.0)
                    
                    Text("Date")
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                    
                    //MARK: Date Picker
                    HStack {
                        Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                            .font(.system(size: 23.0, weight: .medium))
                            .padding(.leading, 15.0)
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                showDatePicker.toggle()
                            }
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
                    /* .sheet(isPresented: $showDatePicker) {
                        NavigationStack {
                            DatePicker(
                                "Select Date",
                                selection: $selectedDate,
                                displayedComponents: .date
                            )
                            .datePickerStyle(.graphical)
                            .padding()
                            .navigationTitle("Choose Date")
                            .toolbar {
                                ToolbarItem(placement: .topBarTrailing) {
                                    Button("Done") {
                                        showDatePicker = false
                                    }
                                }
                            }
                        }
                    } */
                    
                    if showDatePicker {
                        DatePicker(
                            "",
                            selection: $selectedDate,
                            in: ...Date(),
                            displayedComponents: .date
                        )
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .transition(.move(edge: .top).combined(with: .opacity))
                    }
                    
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
                print("date is \(selectedDate)")
               viewModel.save(context: context)
                
            } label: {
                Text("Save Expense")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .alert(item: $viewModel.alertItem) { item in
            Alert(
                title: Text(item.title),
                message: Text(item.message),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    AddExpenseView()
}
