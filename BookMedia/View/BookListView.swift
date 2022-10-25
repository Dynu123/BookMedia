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
        VStack {
            ScrollView {
                VStack(spacing: 30) {
                    switch viewModel.selectedMainTabBarItem {
                    case .all:
                        SearchBar(text: $viewModel.searchText)
                        AllBooksListView().environmentObject(viewModel)
                    case .wishlist:
                        SearchBar(text: $viewModel.searchText)
                        WishListView().environmentObject(viewModel)
                    case .account:
                        AccountView()
                    }
                    Spacer()
                }
                .padding()
                if viewModel.isLoading {
                    LoadingAnimationView {
                        Text("Fetching books...")
                    }
                }
            }
            MainTabBarView(selectedItem: $viewModel.selectedMainTabBarItem)
        }
        .onAppear() {
            viewModel.fetchBooks {}
        }
        .edgesIgnoringSafeArea([.horizontal, .bottom])
        .navigationBarBackButtonHidden()
        .navigationTitle("Books")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView(viewModel: BookViewModel(networkService: NetworkService()))
    }
}

struct AllBooksListView: View {
    @EnvironmentObject private var viewModel: BookViewModel
    
    var body: some View {
        ForEach(viewModel.books.filter({ viewModel.searchText.isEmpty ? true : $0.title.contains(viewModel.searchText)})) { book in
            DisclosureGroup {
                BookDetailView(book: book)
            } label: {
                BookRow(book: book)
            }
            .accentColor(Color.purple)
        }
    }
}

struct WishListView: View {
    @EnvironmentObject private var viewModel: BookViewModel
    
    var body: some View {
        ForEach(viewModel.savedBooks.filter({ viewModel.searchText.isEmpty ? true : $0.title.contains(viewModel.searchText ) })) { book in
            DisclosureGroup {
                BookDetailView(book: book)
            } label: {
                BookRow(book: book)
            }
            .accentColor(Color.purple)
        }
    }
}

struct AccountView: View {
    var body: some View {
        EmptyView()
    }
}
