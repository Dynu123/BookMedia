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
    @Binding var navigateToCart: Bool
    
    init(book: Book, navigateToCart: Binding<Bool>) {
        self.book = book
        self._navigateToCart = navigateToCart
    }
    
    var body: some View {
        ZStack {
            
            VStack(alignment: .leading) {
                Text("isbn: \(book.isbn)")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                Button {
                    //buy action
                    viewModel.addToCart(book: book)
                    navigateToCart = true
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
}

