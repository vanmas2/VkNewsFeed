//
//  VkTokenStorage.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 03.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


final class VkTokenStorage: ValueStorage {
    
    private var store: String?
    
    typealias Object = String
    
    func get() -> Object? {
        return store
    }
    
    func set(_ object: Object) {
        store = object
    }
    
    func remove() {
        store = nil
    }
}

extension VkTokenStorage: VkTokenStorageProtocol {
    
    func getToken() -> String? {
        return get()
    }
    
    func setToken(_ token: String) {
        set(token)
    }
    
    func removeToken() {
        remove()
    }
}
