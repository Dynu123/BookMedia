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
                    case .all, .wishlist:
                        SearchBar(text: $viewModel.searchText).environmentObject(viewModel)
                        AllBooksListView().environmentObject(viewModel)
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
            //MainTabBarView(selectedItem: $viewModel.selectedMainTabBarItem)
        }
        .onAppear() {
            viewModel.fetchBooks {}
        }
        .edgesIgnoringSafeArea([.horizontal, .bottom])
        .navigationBarBackButtonHidden()
        .navigationTitle("Books")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            Button {
                
            } label: {
                Image(systemName: "person.crop.circle.fill")
                    .accentColor(.purple)
            }

        }
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
        ForEach(viewModel.filteredItems.filter({ viewModel.searchText.isEmpty ? true : $0.title.contains(viewModel.searchText)})) { book in
            DisclosureGroup {
                BookDetailView(book: book)
            } label: {
                BookRow(book: book)
            }
            .accentColor(Color.purple)
        }
        .onAppear() {
            if viewModel.selectedMainTabBarItem == .wishlist {
                viewModel.sortFavs()
            }
            
        }
    }
}

struct WishListView: View {
    @EnvironmentObject private var viewModel: BookViewModel
    
    var body: some View {
        ForEach(viewModel.filteredItems.filter({ viewModel.searchText.isEmpty ? true : $0.title.contains(viewModel.searchText ) })) { book in
            DisclosureGroup {
                BookDetailView(book: book)
            } label: {
                BookRow(book: book)
            }
            .accentColor(Color.purple)
        }
        .onAppear() {
            viewModel.sortFavs()
        }
    }
}

struct AccountView: View {
    var body: some View {
        EmptyView()
    }
}
