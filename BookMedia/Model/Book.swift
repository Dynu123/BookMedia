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
}

extension Book {
    static let sample = Book(id: 0, title: "sample title", isbn: "sample isbn", price: 123, currencyCode: "EUR", author: "sample author")
    
    static let sampleArray = [
    Book(id: 1, title: "Android", isbn: "123456", price: 123, currencyCode: "EUR", author: "author1"),
    Book(id: 2, title: "iOS", isbn: "654321", price: 321, currencyCode: "USD", author: "author2"),
    Book(id: 3, title: "Flutter", isbn: "321654", price: 231, currencyCode: "EUR", author: "author3"),
    Book(id: 4, title: "PHP", isbn: "123654", price: 312, currencyCode: "USD", author: "author4"),
    Book(id: 5, title: "JAVA", isbn: "654123", price: 311, currencyCode: "EUR", author: "author5")
    ]
}
