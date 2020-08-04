//
//  SignInIteractor.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 02.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


final class SignInIteractor: SignInIteractorProtocol {
    
    // MARK: Properties
    
    private let signInGateway: SignInGateway
    
    // MARK: Constructors
    
    init(signInGateway: SignInGateway) {
        self.signInGateway = signInGateway
    }
    
    // MARK: Functions
    
    func execute(completion: @escaping SignInCompletion) {
        signIn(onComplete: completion)
    }
}

private extension SignInIteractor {
    
    func signIn(onComplete: @escaping SignInCompletion) {
        signInGateway.sighIn(completion: onComplete)
    }
}
