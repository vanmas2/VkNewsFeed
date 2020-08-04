//
//  ValueStorage.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 03.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


protocol ValueStorage {
    associatedtype Object
    func get() -> Object?
    func set(_ object: Object)
    func remove()
}
