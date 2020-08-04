//
//  SignInViewController.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 30.07.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import UIKit
import VKSdkFramework


final class SignInViewController<View: SignInViewProtocol>: ViewController<View> {

    // MARK: Properties
    
    lazy var vkSdkUIDelegate = SignInViewControllerVKSdkUIDelegate(viewController: self)
    
    private let signInInteractor: SignInIteractorProtocol
    
    // MARK: Constructors
    
    init(signInInteractor: SignInIteractorProtocol) {
        self.signInInteractor = signInInteractor
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewEvents()
    }
}

private extension SignInViewController {
    
    func configureViewEvents() {
        view().signInButtonDidTap = { [weak self] in
            self?.signInInteractor.execute { (result) in
                
            }
        }
    }
}


final class SignInViewControllerVKSdkUIDelegate: NSObject, VKSdkUIDelegate {
    
    unowned var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        viewController.present(controller, animated: true, completion: nil)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        
    }
}
