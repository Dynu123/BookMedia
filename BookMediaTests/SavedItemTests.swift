//
//  SavedItemTests.swift
//  BookMediaTests
//
//  Created by Dyana Varghese on 27/10/22.
//

import XCTest

final class SavedItemTests: XCTestCase {

    let viewModel = BookViewModel(networkService: NetworkService())
    
    func test_with_saved_books() {
        viewModel.savedBooks = [1,2]
        viewModel.showingFavs = true
        viewModel.books = Book.sampleArray
        let result = viewModel.filteredItems
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0].id, 1)
        XCTAssertEqual(result[1].id, 2)
    }
    
    func test_with_no_saved_books() {
        viewModel.savedBooks = []
        viewModel.showingFavs = false
        viewModel.books = Book.sampleArray
        let result = viewModel.filteredItems
        XCTAssertEqual(result.count, 5)
        XCTAssertEqual(result[0].id, 1)
        XCTAssertEqual(result[1].id, 2)
        XCTAssertEqual(result[2].id, 3)
        XCTAssertEqual(result[3].id, 4)
        XCTAssertEqual(result[4].id, 5)
    }
    
    func test_sortPrice() {
        viewModel.books = Book.sampleArray
        XCTAssertEqual(viewModel.books[4].price, 311)
        viewModel.sortByPrice()
        XCTAssertEqual(viewModel.books[4].price, 321)
    }
    
    func test_sortCurrency() {
        viewModel.books = Book.sampleArray
        XCTAssertEqual(viewModel.books[4].currencyCode, "EUR")
        viewModel.sortByCurrency()
        XCTAssertEqual(viewModel.books[4].currencyCode, "USD")
    }
    
    func test_toggleSavedBooks() {
        viewModel.books = Book.sampleArray
        viewModel.savedBooks = [1,2]
        viewModel.toggleFav(item: viewModel.books[0])
        XCTAssertEqual(viewModel.savedBooks.count, 1)
        XCTAssertEqual(Array(viewModel.savedBooks)[0], 2)
    }
    
    func test_addToCart() {
        for _ in 0...2 {
            viewModel.addToCart(book: Book.sample)
        }
        viewModel.addToCart(book: Book.sample2)
        XCTAssertEqual(viewModel.cartItems.count, 2)
        XCTAssertEqual(viewModel.cartItems[0].qty, 3)
        XCTAssertEqual(viewModel.cartItems[0].subTotal, 369)
        XCTAssertEqual(viewModel.cartItems[1].qty, 1)
        XCTAssertEqual(viewModel.cartItems[1].subTotal, 123)
    }
    
    func test_totalCartPrice() {
        for _ in 0...2 {
            viewModel.addToCart(book: Book.sample)
        }
        viewModel.addToCart(book: Book.sample2)
        XCTAssertEqual(viewModel.totalCartPrice, 492)
    }
}
