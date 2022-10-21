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
    @ObservedObject private var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ZStack {
            NavigationLink(destination: BookListView(viewModel: BookViewModel(networkService: NetworkService())), isActive: $viewModel.navigate) {
                EmptyView()
            }.isDetailLink(false)
            
                VStack(alignment: .leading) {
                    FormField(fieldName: "Enter email", fieldValue: $email)
                        .padding(.bottom)
                    FormField(fieldName: "Enter password", fieldValue: $password, isSecure: true)
                        .padding(.bottom)
                    if viewModel.showValidationError {
                        Text("Incorrect username and password")
                            .foregroundColor(.red)
                            .padding(.horizontal)
                    }
                    
                    Button {
                        viewModel.navigate = viewModel.validate(email: email, password: password)
                    } label: {
                        Text("Sign In")
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color.black)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
                .padding()
            }
            
        }
        
    }
}

struct FormField: View {
    var fieldName = ""
    @Binding var fieldValue: String
    var isSecure = false
    var body: some View {
        VStack {
            if isSecure {
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            } else {
                TextField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            }
            Divider()
                .frame(height: 1)
                .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                .padding(.horizontal)
        } }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}