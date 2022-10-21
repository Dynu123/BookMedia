//
//  String+extension.swift
//  BookMedia
//
//  Created by Dyana Varghese on 20/10/22.
//

import Foundation

extension String {
    
    // MARK: - Email validation using regex
    var isValid: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
