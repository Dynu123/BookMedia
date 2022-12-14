//
//  BookListView.swift
//  BookMedia
//
//  Created by Dyana Varghese on 19/10/22.
//

import SwiftUI

struct BookListView: View {
    @StateObject private var viewModel = BookViewModel(networkService: NetworkService())
    @State private var showProfile: Bool = false
    @State private var navigateToCart = false
    
    var body: some View {
        NavigationView {
            ZStack {
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
                                Text("Loading...")
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
                        .accentColor(Color.theme)
                }
            }
        }
        
    }
}

