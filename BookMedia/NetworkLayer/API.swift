//
//  API.swift
//  BookMedia
//
//  Created by Dyana Varghese on 20/10/22.
//

import Foundation
import Alamofire

// MARK: - Create API enum conforming to URLRequestBuilder, add the api name
enum API: URLRequestBuilder {
    case getBooks
    case getBookDetail(id: Int)
}

// MARK: - Extend API to implement the inputs
extension API {

    var path: String {
        switch self {
        case .getBooks:
            return "/books"
        case .getBookDetail(let id):
            return "/book/\(id)"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getBooks, .getBookDetail:
            return nil
        }
    }
        
    var method: HTTPMethod {
        switch self {
        case .getBooks, .getBookDetail:
            return .get
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .getBooks, .getBookDetail:
            return ["Content-Type": "application/json"]
        }
    }
    
}
