//
//  SearchBar.swift
//  BookMedia
//
//  Created by Dyana Varghese on 24/10/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    @EnvironmentObject private var viewModel: BookViewModel
    
    private var searchText: Binding<String> {
        return Binding<String>(
            get: {
                self.text.capitalized
            }, set: {
                self.text = $0
            }
        )
    }
    
    var body: some View {
        HStack {
            TextField("Search", text: searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .accentColor(.purple)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    // Dismiss the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                        .foregroundColor(.purple)
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
            SortView()
        }
    }
}

struct SortView: View {
    @EnvironmentObject private var viewModel: BookViewModel
    
    var body: some View {
        Menu {
            Button("By price") {
                viewModel.sortByPrice()
            }
            Button("By currency") {
                viewModel.sortByCurrency()
            }
            Button("By favourites") {
                viewModel.sortFavs()
            }
            Button("Show all") {
                viewModel.showAll()
            }
        } label: {
            Image(systemName: "arrow.up.arrow.down")
                .accentColor(.purple)
        }
    }
}
