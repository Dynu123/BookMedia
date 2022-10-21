//
//  LoginViewModel.swift
//  BookMedia
//
//  Created by Dyana Varghese on 20/10/22.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var navigate: Bool = false
    @Published var showValidationError: Bool = false
    
    func validate(email: String, password: String) -> Bool {
        guard email != "" && password != "" && email.isValid else {
            showValidationError = true
            return false
        }
        showValidationError = false
        return true
    }
    
    func login(email: String, password: String) {
        User.shared.email = email
    }
}
