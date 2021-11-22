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
                self?.showAuthModule()
            } else {
                self?.showRegistrationModule()
            }
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showAuthModule() {
        let controller = AuthViewController()
        
        controller.completionHandler = { [weak self] value in
            self?.showMainModule()
        }
        
        navigationController.pushViewController(controller, animated: true)
       
    }
    
    private func showRegistrationModule() {
        let controller = RegistrationLoginViewController()
        
        controller.completionHandler = { [weak self] value in
            self?.showRegistrationPasswordModule()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showRegistrationPasswordModule() {
        let controller = RegistrationPasswordViewController()
        
        controller.completionHandler = { [weak self] value in
            self?.showMainModule()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showMainModule() {
        let controller = MainViewController()
        // LogOut нереализован
        navigationController.pushViewController(controller, animated: true)
    }
}
