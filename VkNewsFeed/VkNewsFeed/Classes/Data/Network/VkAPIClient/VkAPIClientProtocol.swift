//
//  VkAPIClientProtocol.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 02.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


protocol VkAPIClientProtocol {
    func request<T: Decodable>(_ endpoint: VkAPIEndpoint, decode: T.Type, completion: @escaping (Result<T, APIClientError>) -> Void)
}
