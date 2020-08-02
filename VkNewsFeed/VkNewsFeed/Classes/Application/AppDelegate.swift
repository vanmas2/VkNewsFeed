//
//  AppDelegate.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 29.07.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import UIKit
import VKSdkFramework


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
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if let from = options[.sourceApplication] as? String {
            VKSdk.processOpen(url, fromApplication: from)
        }
        
        return true
    }
}

