//
//  VkAPIEndpoint.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 02.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


// MARK: - API

enum VkAPIEndpoint {
    case newsfeed(Newsfeed)
}

extension VkAPIEndpoint {
    
    struct Newsfeed {
        let sourceIds: String
        let filters: String
        let count: String
        let startFrom: String?
    }
}

// MARK: - EndpointProtocol

extension VkAPIEndpoint: EndpointProtocol {
    
    var path: String {
        switch self {
        case .newsfeed:
            return "newsfeed.get"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .newsfeed:
            return .get
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .newsfeed(let newsfeed):
            var parameters = [String: Any]()
            parameters["source_ids"] = newsfeed.sourceIds
            parameters["filters"] = newsfeed.filters
            parameters["count"] = newsfeed.count
            newsfeed.startFrom.map { parameters["start_from"] = $0 }
            return parameters
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .newsfeed:
            return .url(.queryString)
        }
    }
    
    var baseURL: String {
        return "https://api.vk.com/method/"
    }
    
    var headers: HTTPHeaders? {
        return ["accept": "application/json"]
    }
}
