//
//  VkNewsfeedService.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 03.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


final class VkNewsfeedService {
    
    // MARK: Properties
    
    private let client: VkAPIClient<VkTokenStorage>
    
    // MARK: Constructors
    
    init(client: VkAPIClient<VkTokenStorage>) {
        self.client = client
    }
    
    // MARK: Functions
    
    func getNewsfeeds(from: String?, completion: @escaping (Result<VkNewsfeedAPIModel, APIClientError>) -> Void) {
        let params = VkAPIEndpoint.Newsfeed(
            sourceIds: "friends,groups,pages",
            filters: "post",
            count: "20",
            startFrom: from
        )
        
        client.request(.newsfeed(params), decode: VkNewsfeedAPIModel.self, completion: completion)
    }
}
