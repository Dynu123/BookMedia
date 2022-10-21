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
}

// MARK: - Extend API to implement the inputs
extension API {

    var path: String {
        switch self {
        case .getBooks:
            return "/books"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getBooks:
            return nil
        }
    }
        
    var method: HTTPMethod {
        switch self {
        case .getBooks:
            return .post
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .getBooks:
            return ["Content-Type": "application/json"]
        }
    }
    
}
