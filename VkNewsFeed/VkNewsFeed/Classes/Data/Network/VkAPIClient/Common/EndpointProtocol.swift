//
//  EndpointProtocol.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 02.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


// MARK: - EndpointProtocol

protocol EndpointProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any] { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders? { get }
}

// MARK: - HTTPMethod

enum HTTPMethod {
    case options
    case get
    case head
    case post
    case put
    case patch
    case delete
    case trace
    case connect
}

// MARK: - ParameterEncoding

enum ParameterEncoding {
    case url(URLDestination)
    case json

    enum URLDestination {
        case methodDependent, queryString, httpBody
    }
}

// MARK: - HTTPHeaders

typealias HTTPHeaders = [String: String]
