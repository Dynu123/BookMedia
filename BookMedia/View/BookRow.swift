//
//  BookRow.swift
//  BookMedia
//
//  Created by Dyana Varghese on 21/10/22.
//

import SwiftUI

struct BookRow: View {
    private var book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(book.title)
                    .foregroundColor(.primary)
                    .font(.headline)
                Text("by \(book.author)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer(minLength: 10)
            HStack {
                Text(book.currencyCode)
                    .foregroundColor(.primary)
                    .font(.headline)
                Text("\(book.price)")
                    .foregroundColor(.primary)
                    .font(.headline)
            }
        }
        
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: .sample)
    }
}
