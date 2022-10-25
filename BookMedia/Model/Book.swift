//
//  Book.swift
//  BookMedia
//
//  Created by Dyana Varghese on 20/10/22.
//

import Foundation

struct Book: Codable, Identifiable {
    var id: Int
    var title: String
    var isbn: String
    var price: Int
    var currencyCode: String
    var author: String
    var isBookmarked: Bool = false
    
    mutating func toggleBookmark(isBookmarked: Bool) {
        self.isBookmarked = isBookmarked
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, isbn, price, currencyCode, author
    }
    
}

extension Book {
    static let sample = Book(id: 0, title: "sample title", isbn: "sample isbn", price: 123, currencyCode: "EUR", author: "sample author", isBookmarked: true)
    
    static let sampleArray = [
        Book(id: 1, title: "Android", isbn: "123456", price: 123, currencyCode: "EUR", author: "author1", isBookmarked: true),
    Book(id: 2, title: "iOS", isbn: "654321", price: 321, currencyCode: "USD", author: "author2", isBookmarked: false),
    Book(id: 3, title: "Flutter", isbn: "321654", price: 231, currencyCode: "EUR", author: "author3", isBookmarked: true),
    Book(id: 4, title: "PHP", isbn: "123654", price: 312, currencyCode: "USD", author: "author4", isBookmarked: false),
    Book(id: 5, title: "JAVA", isbn: "654123", price: 311, currencyCode: "EUR", author: "author5", isBookmarked: true)
    ]
}
