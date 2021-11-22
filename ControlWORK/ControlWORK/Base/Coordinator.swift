//
//  Coordinator.swift
//  ControlWORK
//
//  Created by Svetlana Safonova on 22.11.2021.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start()
}
