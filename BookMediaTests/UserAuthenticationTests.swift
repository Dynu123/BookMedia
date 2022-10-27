//
//  UserAuthenticationTests.swift
//  BookMediaTests
//
//  Created by Dyana Varghese on 27/10/22.
//

import XCTest

final class UserAuthenticationTests: XCTestCase {
    let authViewModel = AuthViewModel()
    
    func test_userLogin_first_launch() {
        let isAuthenticated = authViewModel.isAuthenticated()
        XCTAssertEqual(isAuthenticated, false)
    }
    
    func test_user_already_loggedInOnce_onRelaunch() {
        let isAuthenticated = authViewModel.isAuthenticated()
        XCTAssertEqual(isAuthenticated, true)
    }
}
