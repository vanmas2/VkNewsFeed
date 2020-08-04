//
//  AuthorizationService.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 02.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation
import VKSdkFramework


final class AuthorizationService: NSObject {
    
    // MARK: Properties
    
    weak var delegate: VKSdkUIDelegate? {
        didSet {
            sdkInstance.uiDelegate = delegate
        }
    }
    
    // MARK: Private properties
    
    private let tokenStorage: TokenStorageProtocol
    
    private var sdkInstance: VKSdk
        
    private var signInCompletion: SignInCompletion?
    
    // MARK: Constructors
    
    init(tokenStorage: TokenStorageProtocol) {
        self.tokenStorage = tokenStorage
        sdkInstance = VKSdk.initialize(withAppId: Defaults.appID)
        super.init()
        sdkInstance.register(self)
    }
}

extension AuthorizationService: SignInGateway {
    
    func sighIn(completion: @escaping SignInCompletion) {
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

extension AuthorizationService: VKSdkDelegate {
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        guard
            result.state == .authorized,
            let token = result.token.accessToken
            else { return }
        tokenStorage.setToken(token)
        signInCompletion?(.success(()))
    }
    
    func vkSdkUserAuthorizationFailed() {
        tokenStorage.removeToken()
        signInCompletion?(.failure(.unknown))
    }
    
    func vkSdkTokenHasExpired(_ expiredToken: VKAccessToken!) {
        tokenStorage.removeToken()
    }
    
    func vkSdkAuthorizationStateUpdated(with result: VKAuthorizationResult!) {
        if result.state == .authorized {
            signInCompletion?(.success(()))
        } else {
            tokenStorage.removeToken()
            signInCompletion?(.failure(.unknown))
        }
    }
    
    func vkSdkAccessTokenUpdated(_ newToken: VKAccessToken!, oldToken: VKAccessToken!) {
        guard
            newToken != nil,
            let token = newToken.accessToken
            else { return }
        tokenStorage.setToken(token)
    }
}

private extension AuthorizationService {
    
    enum Defaults {
        static let appID = "7556421"
        static let scope = ["wall", "friends"]
    }
}
