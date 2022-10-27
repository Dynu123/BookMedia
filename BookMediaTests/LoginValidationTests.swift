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
        let credential = Credentials(email: "", password: "")
        let viewModel = LoginViewModel(credentials: credential)
        let result = viewModel.loginDisabled
        XCTAssertEqual(result, true)
    }

    func test_LoginValidation_validEmail_But_EmptyPassword() {
        let credential = Credentials(email: "abc@gmail.com", password: "")
        let viewModel = LoginViewModel(credentials: credential)
        let result = viewModel.loginDisabled
        XCTAssertEqual(result, true)
    }
    
    func test_LoginValidation_validEmail_And_ValidPassword() {
        let credential = Credentials(email: "abc@gmail.com", password: "123456")
        let viewModel = LoginViewModel(credentials: credential)
        let result = viewModel.loginDisabled
        XCTAssertEqual(result, false)
        
        let credential1 = Credentials(email: "abc@gmail.co", password: "123456")
        let viewModel1 = LoginViewModel(credentials: credential1)
        let result1 = viewModel1.loginDisabled
        XCTAssertEqual(result1, false)
    }
    
}
