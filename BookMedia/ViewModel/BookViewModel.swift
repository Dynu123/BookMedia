//
//  BookViewModel.swift
//  BookMedia
//
//  Created by Dyana Varghese on 20/10/22.
//

import Foundation
import Combine
import Alamofire

class BookViewModel: ObservableObject {
    @Published var books: [Book] = []
    @Published var showingFavs = false
    @Published var savedBooks: Set<Int> = [1, 7]
    @Published var isLoading: Bool = false
    @Published var searchText: String = ""
    @Published var selectedMainTabBarItem: MainTabBarItem = .all
    
    private var networkService: NetworkServiceProtocol
    private var bag: [AnyCancellable] = []
    
    public init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
        self.savedBooks = db.load()
    }
    
    func fetchBooks(completion: @escaping () -> Void) {
        isLoading = true
        self.networkService.execute(API.getBooks, model: [Book].self) { [weak self] (result: Result<[Book], AFError>) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let books):
                self.books = books
                print(self.books)
                completion() // for test case
            case .failure(let error):
                if let err = error as AFError? {
                    print(err.localizedDescription)
                }
                completion()// for test case
            }
        }.store(in: &bag)
    }
    
    // Filter saved items
    var filteredItems: [Book]  {
        if showingFavs {
            return books.filter { savedBooks.contains($0.id) }
        }
        return books
    }
    
    private var db = Database()
    
    func sortFavs() {
        //withAnimation() {
        showingFavs.toggle()
        //}
    }
    
    func sortByPrice() {
        books.sort { b1, b2 in
            b1.price < b2.price
        }
    }
    
    func sortByCurrency() {
        books.sort { b1, b2 in
            b1.currencyCode < b2.currencyCode
        }
    }
    
    func contains(_ item: Book) -> Bool {
        savedBooks.contains(item.id)
    }
    
    // Toggle saved items
    func toggleFav(item: Book) {
        if contains(item) {
            savedBooks.remove(item.id)
        } else {
            savedBooks.insert(item.id)
        }
        db.save(items: savedBooks)
    }
}
