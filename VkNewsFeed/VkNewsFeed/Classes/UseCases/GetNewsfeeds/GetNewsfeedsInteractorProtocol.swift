//
//  GetNewsfeedsInteractorProtocol.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 05.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


protocol GetNewsfeedsInteractorProtocol {
    func execute(request: GetNewsfeedsRequest, completion: @escaping GetNewsfeedsCompletion)
}

struct GetNewsfeedsRequest {
    let from: String?
}

typealias GetNewsfeedsResponse = NewsfeedsEntity

typealias GetNewsfeedsCompletion = ResultClosure<NewsfeedsEntity, GetNewsfeedsError>

enum GetNewsfeedsError: Error {
    case noResponse
}
