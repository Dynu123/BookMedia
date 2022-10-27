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
    @Published var credentials: Credentials
    
    init(credentials: Credentials) {
        self.credentials = credentials
    }
    
    var loginDisabled: Bool {
        credentials.email.isEmpty || credentials.password.isEmpty || !credentials.email.isValid
    }
    
//    func validate(credentials: Credentials) -> Bool {
//        guard credentials.email != "" && credentials.password != "" && credentials.email.isValid else {
//            return false
//        }
//        return true
//    }
    
    func login(completion: @escaping (Bool) -> Void) {
        if !loginDisabled {
            User.shared.email = credentials.email
            completion(true)
        } else {
            self.credentials = Credentials()
            completion(false)
        }
    }
}
