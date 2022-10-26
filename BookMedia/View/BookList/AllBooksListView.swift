//
//  AllBooksListView.swift
//  BookMedia
//
//  Created by Dyana Varghese on 26/10/22.
//

import SwiftUI

struct AllBooksListView: View {
    @EnvironmentObject private var viewModel: BookViewModel
    @Binding var navigateToCart: Bool
    
    var body: some View {
        ForEach(viewModel.filteredItems.filter({ viewModel.searchText.isEmpty ? true : $0.title.contains(viewModel.searchText)})) { book in
            DisclosureGroup {
                BookDetailView(book: book, navigateToCart: $navigateToCart)
            } label: {
                BookRow(book: book)
            }
            .accentColor(Color.purple)
        }
    }
}

