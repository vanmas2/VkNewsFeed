//
//  ViewController.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 02.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import UIKit


class ViewController<View: UIView>: UIViewController {
    
    override func loadView() {
        view = View()
    }
    
    func view() -> View {
        return view as! View
    }
}
