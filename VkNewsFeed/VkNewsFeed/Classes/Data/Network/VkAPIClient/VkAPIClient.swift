//
//  VkAPIClient.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 02.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation
import Alamofire


final class VkAPIClient<T: ValueStorage> {

    // MARK: Properties
    
    private let manager: Alamofire.Session

    private let queue = DispatchQueue(label: "APIClientQueue")
    
    private let tokenStorage: T

    // MARK: Constructors

    public init(tokenStorage: T) {
        self.tokenStorage = tokenStorage
        let configuration = URLSessionConfiguration.default
        self.manager = Alamofire.Session(configuration: configuration)
    }
    
    // MARK: Functions
    
    func getAdditionalParameters() -> [String: Any] {
        var parameters = [String: Any]()
        
        if let token = tokenStorage.get() {
            parameters["access_token"] = token
            parameters["v"] = "5.122"
        }
        
        return parameters
    }
}

// MARK: - APIClientProtocol

extension VkAPIClient: VkAPIClientProtocol {
    
    func request<T>(_ endpoint: VkAPIEndpoint, decode: T.Type, completion: @escaping (Swift.Result<T, APIClientError>) -> Void) where T : Decodable {
        let additionalParameters = getAdditionalParameters()
        let endpoint = EndpointWrapperConvertible(endpoint: endpoint, additionalParameters: additionalParameters)
        let decoder: (Data) -> Result<T, APIClientError> = { (data) in
            guard
                let result = try? JSONDecoder().decode(decode, from: data)
                else { return .failure(.decode) }
            return .success(result)
        }
        
        manager
            .request(endpoint)
            .validate(validate)
            .responseData(queue: queue) { (response) in
                let newResult = response.result
                    .mapError { APIClientError(afError: $0) }
                    .flatMap(decoder)
                completion(newResult)
            }
    }
}

extension VkAPIClient {

    func validate(
        _ url: URLRequest?,
        _ response: HTTPURLResponse,
        _ data: Data?
    ) -> Alamofire.Request.ValidationResult {
        guard
            (300...599) ~= response.statusCode
            else { return .success(()) }
        
        let error: APIClientError
        
        switch response.statusCode {
        case URLError.timedOut.rawValue:
            error = .timeout
        default:
            error = .code(response.statusCode)
        }

        return .failure(error)
    }
}

extension APIClientError {
    
    init(afError: AFError) {
        if case .responseValidationFailed(let reason) = afError,
            case .customValidationFailed(let customError) = reason,
            let error = customError as? APIClientError
        {
            self = error
        } else {
            self = .unknown
        }
    }
}
