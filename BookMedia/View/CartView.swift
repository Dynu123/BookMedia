//
//  CartView.swift
//  BookMedia
//
//  Created by Dyana Varghese on 26/10/22.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject private var viewModel: BookViewModel
    @State private var navigateToCompletion: Bool = false
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            NavigationLink(destination: OrderConfirmationView(), isActive: $navigateToCompletion) {
                EmptyView()
            }
            .isDetailLink(false)
            
            VStack(alignment: .leading) {
                ForEach(viewModel.cartItems.indices, id: \.self) { index in
                    Text(viewModel.cartItems[index].book.title)
                        .font(.headline)
                    Stepper {
                        Text("Qty: \(viewModel.cartItems[index].qty.trimTrailingZeroes)")
                    } onIncrement: {
                        viewModel.cartItems[index].qty += 1
                    } onDecrement: {
                        viewModel.cartItems[index].qty -= 1
                    }
                    .padding(8)
                    Divider().foregroundColor(.black.opacity(0.3))
                }
                Spacer()
                HStack {
                    Text("Total price")
                        .font(.title2)
                        .bold()
                    Spacer()
                    Text(viewModel.totalCartPrice.trimTrailingZeroes)
                        .font(.title2)
                        .bold()
                }
                Button {
                    navigateToCompletion = true
                } label: {
                    Text("Checkout")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentation.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .accentColor(.purple)
                }

            }
        }
        .navigationTitle("My cart")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

