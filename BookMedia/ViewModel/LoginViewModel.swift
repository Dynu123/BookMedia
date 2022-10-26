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
            return false
        }
        return true
    }
    
    func login(email: String, password: String) {
        navigate = true
//        if validate(email: email, password: password) {
//            navigate = true
//            User.shared.email = email
//        } else {
//            showValidationError = true
//        }
    }
}
