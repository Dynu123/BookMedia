//
//  OrderConfirmationView.swift
//  BookMedia
//
//  Created by Dyana Varghese on 26/10/22.
//

import SwiftUI

struct OrderConfirmationView: View {
    @EnvironmentObject private var viewModel: BookViewModel
    @Binding var navigateToHome: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Text("Thank you!")
                .font(.title2)
            Text("Your order has been placed successfully")
                .font(.title3)
            Spacer()
            Button {
                //
                navigateToHome = false
                viewModel.cartItems = []
            } label: {
                Text("Go to home page")
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
        .navigationBarBackButtonHidden()
        
    }
}

