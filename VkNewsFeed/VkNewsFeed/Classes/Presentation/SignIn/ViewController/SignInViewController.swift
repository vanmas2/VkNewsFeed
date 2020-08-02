//
//  SignInViewController.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 30.07.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import UIKit


final class SignInViewController<View: SignInViewProtocol>: ViewController<View> {

    // MARK: Override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewEvents()
    }
}

private extension SignInViewController {
    
    func configureViewEvents() {
        view().signInButtonDidTap = { [weak self] in
            
        }
    }
}
