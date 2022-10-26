//
//  ContentView.swift
//  BookMedia
//
//  Created by Dyana Varghese on 19/10/22.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @StateObject private var viewModel = LoginViewModel()
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    var body: some View {
            ZStack {
                VStack(alignment: .leading) {
                    FormField(fieldName: "Enter email", fieldValue: $viewModel.credentials.email)
                        .padding(.bottom)
                    FormField(fieldName: "Enter password", fieldValue: $viewModel.credentials.password, isSecure: true)
                        .padding(.bottom)
                    if viewModel.showValidationError {
                        Text("Incorrect username and password")
                            .foregroundColor(.red)
                            .padding(.horizontal)
                    }
                    
                    Button {
                        viewModel.login() { success in
                            authViewModel.updateValidation(success: success)
                        }
                    } label: {
                        Text("Sign In")
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(viewModel.loginDisabled ? Color.purple.opacity(0.5) :  Color.purple)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .disabled(viewModel.loginDisabled)
                }
                .padding()
                .autocapitalization(.none)
            }
            
        
        
    }
}

