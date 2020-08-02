//
//  VkSignInIteractorProtocol.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 02.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


protocol VkSignInIteractorProtocol {
    func execute(completion: @escaping VkSignInCompletion)
}

typealias VkSignInCompletion = ResultClosure<Void, VkSignInError>

enum VkSignInError: Error {
    case unknown
}
