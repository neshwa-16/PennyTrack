//
//  AnalyticsView.swift
//  ExpenseTracker
//
//  Created by Neshwa Parveen on 15/06/26.
//

import SwiftUI

struct AnalyticsView: View {
    
    var body: some View {
       
        ScrollView {
            VStack(spacing: 50) {
                BarChartView()
                
                DonutChartView()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                    
                    VStack(alignment: .leading) {
                        Text("Monthly Comparison")
                            .font(.system(size: 18, weight: .bold))
                            .padding(.top, 25)
                            .padding(.horizontal, 15)
                        
                        HStack(spacing: 15) {
                            Text("June 2026")
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            Text("$2,847.50")
                            
                            Text("+12%")
                                .frame(width: 45, height: 18)
                                .padding(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.red.opacity(0.4))
                                )
                                .foregroundStyle(.red)
                                .padding(.trailing, 5)
                        }
                        .frame(width: .infinity, height: 55)
                        .background(
                           RoundedRectangle(cornerRadius: 18)
                            .fill(
                                LinearGradient(
                                    colors: [.purple.opacity(0.1), .white],
                                    startPoint: .leading,
                                    endPoint: .trailing)
                            )
                        )
                        .padding(5)
                        .padding(.horizontal, 15)
                        
                        HStack(spacing: 15) {
                            Text("May 2026")
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            Text("$2,540.20")
                            
                            Text("-5%")
                                .frame(width: 45, height: 18)
                                .padding(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.green.opacity(0.4))
                                )
                                .foregroundStyle(.green)
                                .padding(.trailing, 5)
                        }
                        .frame(width: .infinity, height: 55)
                        .background(
                           RoundedRectangle(cornerRadius: 18)
                            .fill(
                                LinearGradient(
                                    colors: [.purple.opacity(0.1), .white],
                                    startPoint: .leading,
                                    endPoint: .trailing)
                            )
                        )
                        .padding(5)
                        .padding(.horizontal, 15)
                        
                        
                        HStack(spacing: 15) {
                            Text("April 2026")
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            Text("$2,680.00")
                            
                            Text("+8%")
                                .frame(width: 45, height: 18)
                                .padding(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.red.opacity(0.4))
                                )
                                .foregroundStyle(.red)
                                .padding(.trailing, 5)
                        }
                        .frame(width: .infinity, height: 55)
                        .background(
                           RoundedRectangle(cornerRadius: 18)
                            .fill(
                                LinearGradient(
                                    colors: [.purple.opacity(0.1), .white],
                                    startPoint: .leading,
                                    endPoint: .trailing)
                            )
                        )
                        .padding(5)
                        .padding(.horizontal, 15)
                        .padding(.bottom, 15)
                    }
                }
                
                ZStack {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Text("Advanced Analytics")
                                .font(.system(size: 22, weight: .bold))
                            
                            Spacer()
                            
                            Image(systemName: "lock.square.fill")
                                .resizable()
                                .frame(width: 46, height: 46)
                                .foregroundStyle(.black)
                        }
                        
                        Text("Custom date ranges, predictive insights, export reports, and more")
                        
                        Button {
                            
                        } label: {
                            Text("Upgrade to premium")
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                                .underline()
                                .padding(.bottom, 15)
                        }
                    }
                    //.frame(height: 280)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.gray.opacity(0.3))
                    )
                    
                }
            }
        }
        .padding(20.0)
        .background(.blue.opacity(0.05))
        .scrollIndicators(.hidden)
    }
}

#Preview {
    AnalyticsView()
}
