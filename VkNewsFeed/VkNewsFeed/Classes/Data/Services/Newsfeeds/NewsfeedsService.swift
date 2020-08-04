//
//  NewsfeedsService.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 03.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


final class NewsfeedsService {
    
    // MARK: Properties
    
    private let client: VkAPIClient<TokenStorage>
    
    // MARK: Constructors
    
    init(client: VkAPIClient<TokenStorage>) {
        self.client = client
    }
    
    // MARK: Functions
    
    func newsfeeds(from: String?, completion: @escaping (Result<NewsfeedsResponse, APIClientError>) -> Void) {
        let params = VkAPIEndpoint.Newsfeed(
            sourceIds: "friends,groups,pages",
            filters: "post",
            count: "20",
            startFrom: from
        )
        
        client.request(.newsfeed(params), decode: NewsfeedsResponse.self, completion: completion)
    }
}

extension NewsfeedsService: GetNewsfeedsGateway {
    
    func getNewsfeeds(from: String?, completion: @escaping GetNewsfeedsCompletion) {
        newsfeeds(from: from) { (result) in
            let newResult = result
                .mapError { _ in GetNewsfeedsError.noResponse }
                .map { NewsfeedsEntity(model: $0) }
            completion(newResult)
        }
    }
}
