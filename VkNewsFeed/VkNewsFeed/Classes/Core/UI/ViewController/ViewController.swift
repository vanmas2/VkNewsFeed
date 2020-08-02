//
//  ViewController.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 02.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import UIKit


class ViewController<View: UIView>: UIViewController {
    
    // MARK: Constructors
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Override functions
    
    override func loadView() {
        view = View()
    }
    
    // MARK: Functions
    
    func view() -> View {
        return view as! View
    }
}
