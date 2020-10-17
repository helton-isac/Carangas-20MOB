//
//  AppCoordinator.swift
//  Carangas
//
//  Created by Helton Isac Torres Galindo on 17/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinators: Coordinator?
    
    init() {
        navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.tintColor = UIColor(named: "main")
    }
    
    func start() {
        let childCoordinator = CarsListingCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinators = self
        childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }
}
