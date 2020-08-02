//
//  SignInViewProtocol.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 30.07.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import UIKit


protocol SignInViewProtocol: UIView {
    var signInButtonDidTap: (() -> Void)? { get set }
}
