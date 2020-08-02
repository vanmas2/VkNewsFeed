//
//  View.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 02.08.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import UIKit


class View: UIView {
        
    // MARK: Constructors
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }

    // MARK: Configure UI

    func configureUI() {
        configureViews()
        configureLayout()
        configureStyle()
        configureActions()
    }
    
    func configureViews() {
        
    }
    
    func configureLayout() {
        
    }
    
    func configureStyle() {
        
    }
    
    func configureActions() {
        
    }
}
