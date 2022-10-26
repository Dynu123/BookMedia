//
//  Double+extension.swift
//  BookMedia
//
//  Created by Dyana Varghese on 26/10/22.
//

import Foundation

extension Double {
    var trimTrailingZeroes: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
