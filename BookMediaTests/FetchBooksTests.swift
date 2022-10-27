//
//  BookMediaTests.swift
//  BookMediaTests
//
//  Created by Dyana Varghese on 19/10/22.
//

import XCTest
@testable import BookMedia
import Combine
import Alamofire

final class FetchBooksTests: XCTestCase {
    
    // MARK: - Declare parameters for depedency injection by creating mock network service
    var viewModel: BookViewModel!
    var networkService: MockNetworkService!
    
    override func setUp() {
        networkService = MockNetworkService()
        viewModel = .init(networkService: networkService)
    }
    
    // MARK: - Test for validating data on successfull API call
    func testDatasource_onAPIcall_success() throws {
        networkService.fetchBooks = CurrentValueSubject(Book.sampleArray).eraseToAnyPublisher()
        let expectation = expectation(description: "wait for completion")
        viewModel.fetchBooks {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(viewModel.books)
        XCTAssertEqual(viewModel.books.count, 5)
        XCTAssertEqual(viewModel.books[0].title, "Android" )
    }

    // MARK: - Test for validating data on API call failure
    func testDatasource_onAPIcall_failure() throws {
        let error = AFError.createURLRequestFailed(error: NSError(domain: "", code: 400, userInfo: [:]))
        networkService.fetchBooks = Fail(error: error).eraseToAnyPublisher()
        let expectation = expectation(description: "wait for completion")
        viewModel.fetchBooks {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(viewModel.books)
        XCTAssertEqual(viewModel.books.count, 0)
    }
}
