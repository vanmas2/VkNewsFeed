//
//  APIClientError.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 04.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


enum APIClientError: Error {
    case code(Int)
    case unauthorized
    case decode
    case timeout
    case unknown
}
