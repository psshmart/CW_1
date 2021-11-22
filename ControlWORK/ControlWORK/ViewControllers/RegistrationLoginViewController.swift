//
//  RegistrationLoginViewController.swift
//  ControlWORK
//
//  Created by Svetlana Safonova on 22.11.2021.
//

import UIKit

class RegistrationLoginViewController: UIViewController, FlowController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let loginText = "Enter login"
        static let nextButton = "Next"
        static let loginTextFieldOffset: CGFloat = 40
        static let textFieldWidth: CGFloat = 140
        static let textFieldHeight: CGFloat = 30
        static let topOffset: CGFloat = 15
        static let buttonWidth: CGFloat = 60
    }
    
    // MARK: - Properties
    
    var completionHandler: ((String) -> ())?
    
    private lazy var loginTextField: UITextField = {
        let textField = BaseTextField()
        textField.placeholder = Constants.loginText
        textField.delegate = self
        textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        return textField
    }()
    
    private lazy var nextButton: UIButton = {
        let button = BaseButton()
        button.setTitle(Constants.nextButton, for: .normal)
        button.addTarget(self, action: #selector(nextButtonDidPress), for: .touchUpInside)
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
        nextButton.isEnabled = false
        
        view.addSubview(loginTextField)
        view.addSubview(nextButton)
    }

    private func makeConstraints() {
        loginTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-Constants.loginTextFieldOffset)
            make.width.equalTo(Constants.textFieldWidth)
            make.height.equalTo(Constants.textFieldHeight)
        }
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginTextField.snp.bottom).offset(Constants.topOffset)
            make.width.equalTo(Constants.buttonWidth)
        }
    }
    
    // MARK: - Actions
    
    @objc private func nextButtonDidPress() {
        completionHandler?("pressed")
    }
    
    @objc private func editingChanged(_ textField: UITextField) {
        guard textField.text != "" else {
            nextButton.isEnabled = false
            return
        }
        nextButton.isEnabled = true
    }
}

extension RegistrationLoginViewController: UITextFieldDelegate {
}
