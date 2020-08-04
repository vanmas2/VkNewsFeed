//
//  VkTokenStorageProtocol.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 03.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


protocol VkTokenStorageProtocol {
    func getToken() -> String?
    func setToken(_ token: String)
    func removeToken()
}
