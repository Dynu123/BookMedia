//
//  EmailValidationTests.swift
//  BookMediaTests
//
//  Created by Dyana Varghese on 20/10/22.
//

import XCTest
@testable import BookMedia

final class EmailValidationTests: XCTestCase {

    let viewModel = LoginViewModel()
    
    func test_email_invalid() {
        let result1 = "abc".isValid
        XCTAssertEqual(result1, false)
        
        let result2 = ".com".isValid
        XCTAssertEqual(result2, false)
        
        let result3 = "abc.com".isValid
        XCTAssertEqual(result3, false)
        
        let result4 = "abc@com".isValid
        XCTAssertEqual(result4, false)
    }
    
    func test_email_valid() {
        let result1 = "abc@gmail.com".isValid
        XCTAssertEqual(result1, true)
    }
    
    func test_email_empty() {
        let result1 = "".isValid
        XCTAssertEqual(result1, false)
        
    }

}

