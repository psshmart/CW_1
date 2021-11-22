//
//  ProfileCoordinator.swift
//  ControlWORK
//
//  Created by Svetlana Safonova on 22.11.2021.
//

import UIKit

class ProfileCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showProfileModule()
    }
    
    private func showProfileModule() {
        let controller = ProfileViewController()
        
        controller.completionHandler = { [weak self] string in
            if string == "signIn" {
                self?.showAuth()
            } else {
                self?.showRegistration()
            }
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showAuth() {
        print("auth")
    }
    
    private func showRegistration() {
        print("registration")
    }
}
