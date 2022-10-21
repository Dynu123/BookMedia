//
//  LoginValidationTest.swift
//  BookMediaTests
//
//  Created by Dyana Varghese on 20/10/22.
//

import XCTest
@testable import BookMedia

final class LoginValidationTests: XCTestCase {
    
    func test_LoginValidation_emptyEmail_And_Password() {
        let viewModel = LoginViewModel()
        let result = viewModel.validate(email: "", password: "")
        XCTAssertEqual(result, false)
    }

    func test_LoginValidation_validEmail_But_EmptyPassword() {
        let viewModel = LoginViewModel()
        let result = viewModel.validate(email: "abc@gmail.com", password: "")
        XCTAssertEqual(result, false)
    }
    
    func test_LoginValidation_validEmail_And_ValidPassword() {
        let viewModel = LoginViewModel()
        let result = viewModel.validate(email: "abc@gmail.com", password: "123456")
        XCTAssertEqual(result, true)
    }
}
