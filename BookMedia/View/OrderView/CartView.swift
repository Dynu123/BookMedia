//
//  CartView.swift
//  BookMedia
//
//  Created by Dyana Varghese on 26/10/22.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject private var viewModel: BookViewModel
    @Binding var navigateToCompletion: Bool
    
    var body: some View {
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
            NavigationLink(destination: OrderConfirmationView(navigateToHome: $navigateToCompletion).environmentObject(viewModel)) {
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
            .isDetailLink(false)
            
        }
        .padding()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    //presentation.wrappedValue.dismiss()
                    navigateToCompletion = false
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
