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
    @Published var book: Book = Book.sample
    @Published var showingFavs = false
    @Published var savedBooks: Set<Int> = []
    private var db = Database()
    
    @Published var isLoading: Bool = false
    @Published var searchText: String = ""
    
    @Published var cartItems: [CartItem] = []
    
    private var networkService: NetworkServiceProtocol
    private var bag: [AnyCancellable] = []
    
    init(networkService: NetworkServiceProtocol) {
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
    
    func fetchBookDetail(id: Int, completion: @escaping () -> Void) {
        isLoading = true
        self.networkService.execute(API.getBookDetail(id: id), model: Book.self) { [weak self] (result: Result<Book, AFError>) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let book):
                self.book = book
                print(self.book)
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
    
    func showAll() {
        showingFavs = false
    }
    
    func sortFavs() {
        showingFavs = true
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
    
    func addToCart(book: Book) {
        var addNewProduct = true
        for (index, item) in cartItems.enumerated() {
            if item.book.id == book.id {
                cartItems[index].qty += 1
                addNewProduct = false
            }
        }
        if addNewProduct {
            cartItems.append(CartItem(book: book, qty: 1))
        }
    }
    
    var totalCartPrice: Double {
        var total: Double = 0.0
        for each in cartItems {
            total += each.subTotal
        }
        return total
    }
}
