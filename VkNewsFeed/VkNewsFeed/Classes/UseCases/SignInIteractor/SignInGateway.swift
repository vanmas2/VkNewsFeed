//
//  SignInGateway.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 02.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


protocol SignInGateway {
    func sighIn(completion: @escaping SignInCompletion)
}
