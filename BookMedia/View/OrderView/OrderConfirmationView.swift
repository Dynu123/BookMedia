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
            SolidButton(title: "Go back") {
                navigateToHome = false
                viewModel.cartItems = []
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
        
    }
}

