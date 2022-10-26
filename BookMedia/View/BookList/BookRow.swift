//
//  BookRow.swift
//  BookMedia
//
//  Created by Dyana Varghese on 21/10/22.
//

import SwiftUI

struct BookRow: View {
    @EnvironmentObject private var viewModel: BookViewModel
    @State private var book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(book.title)
                    .foregroundColor(.primary)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                Text("by \(book.author)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer(minLength: 10)
            VStack(alignment: .trailing) {
                HStack {
                    Text(book.currencyCode)
                        .foregroundColor(.primary)
                        .font(.headline)
                    Text("\(book.price.trimTrailingZeroes)")
                        .foregroundColor(.primary)
                        .font(.headline)
                }
                Spacer()
                Image(systemName: viewModel.contains(book) ? "bookmark.fill" : "bookmark")
                    .foregroundColor(.purple)
                    .onTapGesture {
                        viewModel.toggleFav(item: book)
                    }
                Spacer()
            }
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: .sample)
    }
}