//
//  Storage.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 03.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import Foundation


protocol Storage {
    associatedtype Object: Identifiable
    associatedtype ID: Hashable
    func get(id: ID) -> Object?
    func getAll() -> [Object]
    func set(_ object: Object)
    func remove(id: ID)
}
