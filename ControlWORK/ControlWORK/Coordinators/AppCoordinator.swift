//
//  AppCoordinator.swift
//  ControlWORK
//
//  Created by Svetlana Safonova on 22.11.2021.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    private var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let isAuth = false
        
        if !isAuth {
            showProfileFlow()
        }
    }
    
    private func showProfileFlow() {
        let profileCoordinator = ProfileCoordinator(navigationController: navigationController)
        
        childCoordinators.append(profileCoordinator)
        profileCoordinator.start()
    }
}
