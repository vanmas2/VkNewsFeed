//
//  EndpointWrapperConvertible.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 02.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation
import Alamofire


struct EndpointWrapperConvertible: URLRequestConvertible {
    
    // MARK: Properties
    
    private var endpoint: EndpointProtocol
    
    private var additionalParameters: [String: Any]
    
    // MARK: Constructors
    
    init(endpoint: EndpointProtocol, additionalParameters: [String: Any]) {
        self.endpoint = endpoint
        self.additionalParameters = additionalParameters
    }
    
    // MARK: Functions
    
    func asURLRequest() throws -> URLRequest {
        var parameters = endpoint.parameters
        additionalParameters.forEach { parameters[$0.key] = $0.value }
        
        let originalRequest = try URLRequest(
            url: endpoint.baseURL.appending(endpoint.path),
            method: endpoint.alamofireMethod,
            headers: Alamofire.HTTPHeaders(endpoint.headers ?? [:])
        )
        
        let encodedRequest = try endpoint.alamofireEncoding.encode(
            originalRequest,
            with: parameters
        )
        
        return encodedRequest
    }
}

extension EndpointProtocol {

    var alamofireMethod: Alamofire.HTTPMethod {
        switch method {
        case .options: return .options
        case .get: return .get
        case .head: return .head
        case .post: return .post
        case .put: return .put
        case .patch: return .patch
        case .delete: return .delete
        case .trace: return .trace
        case .connect: return .connect
        }
    }

    var alamofireEncoding: Alamofire.ParameterEncoding {
        switch encoding {
        case .url(let dest):
            switch dest {
            case .methodDependent:
                return Alamofire.URLEncoding.default
            case .queryString:
                return Alamofire.URLEncoding.queryString
            case .httpBody:
                return Alamofire.URLEncoding.httpBody
            }

        case .json: return Alamofire.JSONEncoding()
        }
    }
}
