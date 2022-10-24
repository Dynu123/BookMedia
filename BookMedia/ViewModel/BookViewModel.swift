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
    @Published var isLoading: Bool = false
    @Published var searchText: String = ""
    
    private var networkService: NetworkServiceProtocol
    private var bag: [AnyCancellable] = []

    public init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
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
}
