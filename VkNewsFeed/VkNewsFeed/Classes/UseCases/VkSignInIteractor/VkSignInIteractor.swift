//
//  VkSignInIteractor.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 02.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


final class VkSignInIteractor: VkSignInIteractorProtocol {
    
    // MARK: Properties
    
    private let vkSignInGateway: VkSignInGateway
    
    // MARK: Constructors
    
    init(vkSignInGateway: VkSignInGateway) {
        self.vkSignInGateway = vkSignInGateway
    }
    
    // MARK: Functions
    
    func execute(completion: @escaping VkSignInCompletion) {
        signIn(onComplete: completion)
    }
}

private extension VkSignInIteractor {
    
    func signIn(onComplete: @escaping VkSignInCompletion) {
        vkSignInGateway.sighIn(completion: onComplete)
    }
}
