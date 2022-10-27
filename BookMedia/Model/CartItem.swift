//
//  Cart.swift
//  BookMedia
//
//  Created by Dyana Varghese on 26/10/22.
//

import Foundation

struct CartItem {
    var id: UUID = UUID()
    var book: Book
    var qty: Double
    var subTotal: Double {
        return book.price * qty
    }
}

extension CartItem {
    static var sample = CartItem(book: Book.sample, qty: 3)
}
