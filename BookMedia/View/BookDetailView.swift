//
//  BookDetailView.swift
//  BookMedia
//
//  Created by Dyana Varghese on 24/10/22.
//

import SwiftUI

struct BookDetailView: View {
    @EnvironmentObject private var viewModel: BookViewModel
    @State private var book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("isbn: \(book.isbn)")
                .foregroundColor(.secondary)
                .font(.subheadline)
            Button {
                //buy action
                viewModel.navigate = true
            } label: {
                HStack {
                    Text("Buy this book")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(book: .sample)
    }
}
