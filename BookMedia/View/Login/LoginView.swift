//
//  ContentView.swift
//  BookMedia
//
//  Created by Dyana Varghese on 19/10/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel(credentials: Credentials())
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                FormField(fieldName: "Enter email", fieldValue: $viewModel.credentials.email)
                    .padding(.bottom)
                FormField(fieldName: "Enter password", isSecure: true, fieldValue: $viewModel.credentials.password)
                    .padding(.bottom)
                SolidButton(title: "Sign In") {
                    viewModel.login() { success in
                        authViewModel.updateValidation(success: success)
                    }
                }.disabled(viewModel.loginDisabled)
            }
            .padding()
            .autocapitalization(.none)
        }
    }
}

