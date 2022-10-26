//
//  BookListView.swift
//  BookMedia
//
//  Created by Dyana Varghese on 19/10/22.
//

import SwiftUI

struct BookListView: View {
    @ObservedObject private var viewModel: BookViewModel
    @State private var showProfile: Bool = false
    @State private var navigateToCart = false
    
    init(viewModel: BookViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            NavigationLink(destination: CartView().environmentObject(viewModel), isActive: $navigateToCart) {
                EmptyView()
            }.isDetailLink(false)
            VStack {
                ScrollView {
                    VStack(spacing: 30) {
                        SearchBar(text: $viewModel.searchText).environmentObject(viewModel)
                        AllBooksListView(navigateToCart: $navigateToCart).environmentObject(viewModel)
                        Spacer()
                    }
                    .padding()
                    if viewModel.isLoading {
                        LoadingAnimationView {
                            Text("Fetching books...")
                        }
                    }
                }
            }
            if showProfile {
                ProfileView(showProfile: $showProfile)
            }
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
                showProfile = true
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
