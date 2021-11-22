//
//  BaseButton.swift
//  ControlWORK
//
//  Created by Svetlana Safonova on 22.11.2021.
//

import UIKit

class BaseButton: UIButton {
    
    private enum Constants {
        static let cornerRadius: CGFloat = 10
        static let borderWidth: CGFloat = 1
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        layer.cornerRadius = Constants.cornerRadius
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = Constants.borderWidth
        setTitleColor(.black, for: .normal)
    }
}
