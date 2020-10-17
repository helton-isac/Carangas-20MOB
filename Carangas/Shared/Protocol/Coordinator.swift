//
//  Coordinator.swift
//  Carangas
//
//  Created by Helton Isac Torres Galindo on 17/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController {get set}
    var childCoordinators: [Coordinator]  {get set}
    var parentCoordinators: Coordinator?  {get set}
    
    func start()
    func add(childCoordinator coordinator: Coordinator)
    func remove(childCoordinator coordinator: Coordinator)
}

extension Coordinator {
    func add(childCoordinator coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func remove(childCoordinator coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
