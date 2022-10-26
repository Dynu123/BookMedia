//
//  LoginViewModel.swift
//  BookMedia
//
//  Created by Dyana Varghese on 20/10/22.
//

import Foundation
import Combine

struct Credentials: Codable {
    var email: String = ""
    var password: String = ""
}

class LoginViewModel: ObservableObject {
    @Published var credentials = Credentials()
    
    var loginDisabled: Bool {
        credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    @Published var showValidationError: Bool = false
    
    func validate(email: String, password: String) -> Bool {
        guard email != "" && password != "" && email.isValid else {
            return false
        }
        return true
    }
    
    func login(completion: @escaping (Bool) -> Void) {
        if validate(email: credentials.email, password: credentials.password) {
            User.shared.email = credentials.email
            completion(true)
        } else {
            showValidationError = true
            self.credentials = Credentials()
            completion(false)
        }
    }
}
