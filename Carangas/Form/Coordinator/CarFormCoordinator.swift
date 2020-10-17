//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Helton Isac Torres Galindo on 17/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarFormCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinators: Coordinator?
    let carFormViewModel: CarFormViewModel
    
    init(navigationController: UINavigationController, carFormViewModel: CarFormViewModel = CarFormViewModel()) {
        self.navigationController = navigationController
        self.carFormViewModel = carFormViewModel   
    }
    
    func start() {
        let viewController = CarFormViewController.instantiateFromStoryboard(.form)
        viewController.viewModel = carFormViewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}
