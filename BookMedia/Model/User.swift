//
//  User.swift
//  BookMedia
//
//  Created by Dyana Varghese on 20/10/22.
//

import Foundation

class User {
    static let shared = User()
    private init() {}

    var email: String = ""    
}
