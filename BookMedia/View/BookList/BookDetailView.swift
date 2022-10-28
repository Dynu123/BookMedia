//
//  BookDetailView.swift
//  BookMedia
//
//  Created by Dyana Varghese on 24/10/22.
//

import SwiftUI

struct BookDetailView: View {
    @EnvironmentObject private var viewModel: BookViewModel
    private var book: Book
    @Binding var navigateToCart: Bool
    @Environment(\.presentationMode) var presentationMode
    
    init(book: Book, navigateToCart: Binding<Bool>) {
        self.book = book
        self._navigateToCart = navigateToCart
    }
    
    var body: some View {
        ZStack {
            NavigationLink(destination: CartView(navigateToCompletion: $navigateToCart).environmentObject(viewModel), isActive: $navigateToCart) {
                EmptyView()
            }.isDetailLink(false)
            ScrollView {
                VStack(alignment: .leading) {
                    Text(viewModel.book.title)
                        .foregroundColor(.primary)
                        .font(.system(.headline, design: .rounded))
                    Text("by \(viewModel.book.author)")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.secondary)
                    Text("ISBN: \(viewModel.book.isbn)")
                        .foregroundColor(.secondary)
                        .font(.system(.subheadline, design: .rounded))
                        .padding(.vertical, 5)
                    HStack {
                        Text(viewModel.book.currencyCode + " " +  "\(viewModel.book.price.trimTrailingZeroes)")
                            .foregroundColor(Color.theme)
                            .font(.system(.headline, design: .rounded))
                        Spacer()
                        Image(systemName: viewModel.contains(book) ? "bookmark.fill" : "bookmark")
                            .foregroundColor(Color.theme)
                            .onTapGesture {
                                viewModel.toggleFav(item: viewModel.book)
                            }
                    }.padding(.vertical, 10)
                    Text("About the book:")
                        .foregroundColor(.primary)
                        .font(.system(.headline, design: .rounded))
                        .padding(.vertical, 5)
                    Text(viewModel.book.description ?? "")
                        .foregroundColor(.secondary)
                        .font(.system(.headline, design: .rounded))
                    Spacer()
                    SolidButton(title: "Buy this book") {
                        viewModel.addToCart(book: viewModel.book)
                        navigateToCart = true
                    }.padding(.vertical, 40)
                }
                .padding(.horizontal)
            }
            if viewModel.isLoading {
                LoadingAnimationView {
                    Text("Loading...")
                }
            }
        }
        .onAppear() {
            viewModel.fetchBookDetail(id: book.id) {}
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .accentColor(Color.theme)
                }
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

