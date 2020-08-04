//
//  SignInIteractorProtocol.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 02.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


protocol SignInIteractorProtocol {
    func execute(completion: @escaping SignInCompletion)
}

typealias SignInCompletion = ResultClosure<Void, SignInError>

enum SignInError: Error {
    case unknown
}
