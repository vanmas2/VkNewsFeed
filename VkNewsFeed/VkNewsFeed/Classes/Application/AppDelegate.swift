//
//  AppDelegate.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 29.07.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let rootController = UINavigationController()
        let controller = SignInViewController<SignInView>()
        window = UIWindow()
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
        
        rootController.setNavigationBarHidden(true, animated: false)
        rootController.setViewControllers([controller], animated: false)
        
        return true
    }
}

