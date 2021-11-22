//
//  ProfileViewController.swift
//  ControlWORK
//
//  Created by Svetlana Safonova on 22.11.2021.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController, FlowController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let signInText = "Sign In"
        static let signUpText = "Sign Up"
        static let signInButtonOffset: CGFloat = 40
        static let signUpButtonOffset: CGFloat = 15
        static let buttonWidth: CGFloat = 90
    }
    
    // MARK: - Properties
    
    var completionHandler: ((String?) -> ())?
    
    private lazy var signInButton: UIButton = {
        let button = BaseButton()
        button.setTitle(Constants.signInText, for: .normal)
        button.addTarget(self, action: #selector(signInButtonDidPress), for: .touchUpInside)
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = BaseButton()
        button.setTitle(Constants.signUpText, for: .normal)
        button.addTarget(self, action: #selector(signUpButtonDidPress), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Instance Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
    }
    
    private func makeConstraints() {
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-Constants.signInButtonOffset)
            make.width.equalTo(Constants.buttonWidth)
        }
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signInButton.snp.bottom).offset(Constants.signUpButtonOffset)
            make.width.equalTo(Constants.buttonWidth)
        }
    }
    
    // MARK: - Actions
    
    @objc private func signInButtonDidPress() {
        completionHandler?("signIn")
    }
    
    @objc private func signUpButtonDidPress() {
        completionHandler?("signUp")
    }

}
