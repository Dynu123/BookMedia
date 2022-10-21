//
//  MockNetworkService.swift
//  BookMediaTests
//
//  Created by Dyana Varghese on 21/10/22.
//

import Foundation
@testable import BookMedia
import Combine
import Alamofire


// MARK: - Class for mocking NetworkServiceProtocol
class MockNetworkService: NetworkServiceProtocol {
    
    var fetchBooks: AnyPublisher<[Book], Error>?
    
    func execute<T>(_ urlRequest: URLRequestBuilder, model: T.Type, completion: @escaping (Result<T, AFError>) -> Void) -> AnyCancellable where T : Decodable, T : Encodable {
        if let result = fetchBooks?.eraseToAnyPublisher() {
            let cancellable =  result
                .subscribe(on: DispatchQueue(label: "Background Queue", qos: .background))
                .receive(on: RunLoop.main)
                .sink { errorCompletion in
                    switch errorCompletion {
                    case .failure(let error):
                        completion(.failure(error as! AFError))
                    case .finished: break
                    }
                    
                } receiveValue: { response in
                    completion(.success(response as! T))
                }
            return cancellable
        } else {
            fatalError("Result cannot be nil")
        }
    }
}
