//
//  GetNewsfeedsInteractor.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 05.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


final class GetNewsfeedsInteractor: GetNewsfeedsInteractorProtocol {
    
    // MARK: Properties
    
    private let getNewsfeedsGateway: GetNewsfeedsGateway
    
    // MARK: Constructors
    
    init(getNewsfeedsGateway: GetNewsfeedsGateway) {
        self.getNewsfeedsGateway = getNewsfeedsGateway
    }
    
    // MARK: Functions
    
    func execute(request: GetNewsfeedsRequest, completion: @escaping GetNewsfeedsCompletion) {
        getNewsfeeds(from: request.from, onComplete: completion)
    }
}

private extension GetNewsfeedsInteractor {
    
    func getNewsfeeds(from: String?, onComplete: @escaping GetNewsfeedsCompletion) {
        getNewsfeedsGateway.getNewsfeeds(from: from, completion: onComplete)
    }
}
