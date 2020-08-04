//
//  GetNewsfeedsGateway.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 05.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


protocol GetNewsfeedsGateway {
    func getNewsfeeds(from: String?, completion: @escaping GetNewsfeedsCompletion)
}
