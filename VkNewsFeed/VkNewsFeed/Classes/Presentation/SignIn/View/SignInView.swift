//
//  SignInView.swift
//  VkNewsFeed
//
//  Created by Иван Масальских on 30.07.2020.
//  Copyright © 2020 Masalskikh. All rights reserved.
//

import UIKit


final class SignInView: View, SignInViewProtocol {
    
    // MARK:  Views
    
    private var signInButton: UIButton!
    
    // MARK: Events
    
    var signInButtonDidTap: (() -> Void)?
    
    // MARK: Override functions
        
    override func configureViews() {
        signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(signInButton)
    }
    
    override func configureLayout() {
        NSLayoutConstraint.activate([
            signInButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            signInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 31),
            signInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -31),
        ])
        signInButton.contentEdgeInsets = .init(top: 17, left: 15, bottom: 15, right: 15)
    }
    
    override func configureActions() {
        signInButton.addTarget(self, action: #selector(signInButtonDidTap(_:)), for: .touchUpInside)
    }
    
    override func configureStyle() {
        backgroundColor = .white
        let title = signInButtonTitleStyled(text: "Войти")
        signInButton.setAttributedTitle(title, for: .normal)
        signInButtonStyle(signInButton)
    }
}

// MARK: - Actions

private extension SignInView {
    
    @objc
    func signInButtonDidTap(_ sender: UIButton) {
        signInButtonDidTap?()
    }
}

// MARK: - Styles

private extension SignInView {
    
    func signInButtonStyle(_ button: UIButton) {
        button.backgroundColor = UIColor(red: 0.24, green: 0.36, blue: 1.00, alpha: 1.00)
        button.cornerRadius(10)
    }
    
    func signInButtonTitleStyled(text: String) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2.5
        
        let font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
        let attributedString = NSAttributedString(
            string: text,
            attributes: [
                .font: font,
                .foregroundColor: UIColor.white,
                .paragraphStyle: paragraphStyle,
                .kern: -0.24
            ]
        )
        
        return attributedString
    }
}
