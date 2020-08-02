//
//  VkService.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 02.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation
import VKSdkFramework


final class VkService: NSObject {
    
    // MARK: Properties
    
    weak var delegate: VKSdkUIDelegate? {
        didSet {
            sdkInstance.uiDelegate = delegate
        }
    }
    
    // MARK: Private properties
    
    private var sdkInstance: VKSdk
    
    private var credentials: Credentials?
    
    private var signInCompletion: VkSignInCompletion?
    
    // MARK: Constructors
    
    override init() {
        sdkInstance = VKSdk.initialize(withAppId: Defaults.appID)
        super.init()
        sdkInstance.register(self)
    }
}

extension VkService: VkSignInGateway {
    
    func sighIn(completion: @escaping VkSignInCompletion) {
        signInCompletion = completion
        VKSdk.wakeUpSession(Defaults.scope) { (state, error) in
            if state == .authorized {
                self.signInCompletion?(.success(()))
            } else {
                VKSdk.authorize(Defaults.scope)
            }
        }
    }
}

extension VkService: VKSdkDelegate {
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        guard
            result.state == .authorized,
            let userId = result.token.userId,
            let token = result.token.accessToken
            else { return }
        credentials = Credentials(userId: userId, token: token)
        signInCompletion?(.success(()))
    }
    
    func vkSdkUserAuthorizationFailed() {
        credentials = nil
        signInCompletion?(.failure(.unknown))
    }
    
    func vkSdkTokenHasExpired(_ expiredToken: VKAccessToken!) {
        credentials = nil
    }
    
    func vkSdkAuthorizationStateUpdated(with result: VKAuthorizationResult!) {
        if result.state == .authorized {
            signInCompletion?(.success(()))
        } else {
            credentials = nil
            signInCompletion?(.failure(.unknown))
        }
    }
    
    func vkSdkAccessTokenUpdated(_ newToken: VKAccessToken!, oldToken: VKAccessToken!) {
        guard
            newToken != nil,
            let userId = newToken.userId,
            let token = newToken.accessToken
            else { return }
        credentials = Credentials(userId: userId, token: token)
    }
}

private extension VkService {
        
    struct Credentials {
        let userId: String
        let token: String
    }
}

private extension VkService {
    
    enum Defaults {
        static let appID = "7556421"
        static let scope = ["wall"]
    }
}
