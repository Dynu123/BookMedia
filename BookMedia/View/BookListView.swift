//
//  BookListView.swift
//  BookMedia
//
//  Created by Dyana Varghese on 19/10/22.
//

import SwiftUI

struct BookListView: View {
    @ObservedObject private var viewModel: BookViewModel
    
    init(viewModel: BookViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.books, id: \.id) { book in
            HStack {
                VStack {
                    Text(book.title)
                    Text("by \(book.author)")
                }
                HStack {
                    Text(book.currencyCode)
                    Text("\(book.price)")
                }
            }
        }
        .onAppear() {
            viewModel.fetchBooks {}
        }
        .edgesIgnoringSafeArea([.horizontal, .bottom])
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView(viewModel: BookViewModel(networkService: NetworkService()))
    }
}
