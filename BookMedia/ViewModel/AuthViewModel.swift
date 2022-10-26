//
//  AuthViewModel.swift
//  BookMedia
//
//  Created by Dyana Varghese on 26/10/22.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var isUserLoggedIn = false
    
    func isAuthenticated() -> Bool {
        return UserDefaults.standard.bool(forKey: "isUserLoggedIn")
    }
    
    func updateValidation(success: Bool) {
        isUserLoggedIn = success
        UserDefaults.standard.set(isUserLoggedIn, forKey: "isUserLoggedIn")
    }
}
 
