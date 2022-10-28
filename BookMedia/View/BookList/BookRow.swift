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
                    .font(.system(.headline, design: .rounded))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                Text("by \(book.author)")
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.secondary)
            }
            Spacer(minLength: 10)
            VStack(alignment: .trailing) {
                HStack {
                    Text(book.currencyCode)
                        .foregroundColor(.primary)
                        .font(.system(.headline, design: .rounded))
                    Text("\(book.price.trimTrailingZeroes)")
                        .foregroundColor(.primary)
                        .font(.system(.headline, design: .rounded))
                }
                Spacer()
                Image(systemName: viewModel.contains(book) ? "bookmark.fill" : "bookmark")
                    .foregroundColor(Color.theme)
                    .onTapGesture {
                        viewModel.toggleFav(item: book)
                    }
                Spacer()
            }
        }
    }
}

