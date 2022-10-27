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
            NavigationLink {
                BookDetailView(book: book, navigateToCart: $navigateToCart).environmentObject(viewModel)
            } label: {
                BookRow(book: book)
            }.isDetailLink(false)
                .accentColor(Color.purple)
        }
    }
}

