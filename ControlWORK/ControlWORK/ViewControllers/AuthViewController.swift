//
//  AuthViewController.swift
//  ControlWORK
//
//  Created by Svetlana Safonova on 22.11.2021.
//

import UIKit

class AuthViewController: UIViewController, FlowController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let loginText = "Enter login"
        static let passwordText = "Enter password"
        static let nextButton = "Next"
        static let loginTextFieldOffset: CGFloat = 40
        static let textFieldWidth: CGFloat = 140
        static let textFieldHeight: CGFloat = 30
        static let topOffset: CGFloat = 15
        static let buttonWidth: CGFloat = 60
    }
    
    // MARK: - Properties
    var completionHandler: ((String?) -> ())?
    
    private lazy var loginTextField: UITextField = {
        let textField = BaseTextField()
        textField.placeholder = Constants.loginText
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = BaseTextField()
        textField.placeholder = Constants.passwordText
        textField.delegate = self
        return textField
    }()
    
    private lazy var nextButton: UIButton = {
        let button = BaseButton()
        button.setTitle(Constants.nextButton, for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(nextButtonDidPress), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Instance Properties

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        view.backgroundColor = .white
        
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(nextButton)
    }

    private func makeConstraints() {
        loginTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-Constants.loginTextFieldOffset)
            make.width.equalTo(Constants.textFieldWidth)
            make.height.equalTo(Constants.textFieldHeight)
        }
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginTextField.snp.bottom).offset(Constants.topOffset)
            make.width.equalTo(Constants.textFieldWidth)
            make.height.equalTo(Constants.textFieldHeight)
        }
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(Constants.topOffset)
            make.width.equalTo(Constants.buttonWidth)
        }
    }
    
    // MARK: - Actions
    
    @objc func nextButtonDidPress() {
        completionHandler?("pressed")
    }
}


extension AuthViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == loginTextField {
            guard textField.text != "" else {
                nextButton.isEnabled = false
                return
            }
            guard passwordTextField.text != "" else {
                nextButton.isEnabled = false
                return
            }
            nextButton.isEnabled = true
        } else {
            guard textField.text != "" else {
                nextButton.isEnabled = false
                return
            }
            guard loginTextField.text != "" else {
                nextButton.isEnabled = false
                return
            }
            nextButton.isEnabled = true
        }
    }
}
