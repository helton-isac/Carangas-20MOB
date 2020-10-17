//
//  CarVisualizationCoordinator.swift
//  Carangas
//
//  Created by Helton Isac Torres Galindo on 17/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarVisualizationCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinators: Coordinator?
    var carVisualizationViewModel: CarVisualizationViewModel
    
    init(navigationController: UINavigationController, carVisualizationViewModel: CarVisualizationViewModel) {
        self.navigationController = navigationController
        self.carVisualizationViewModel = carVisualizationViewModel
    }
    
    func start() {
        let viewController = CarVisualizationViewController.instantiateFromStoryboard(.visualization)
        viewController.viewModel = carVisualizationViewModel
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        parentCoordinators?.childDidFinish(self)
    }
    
    deinit {
        print("CarVisualizationCoordinator -> deinit")
    }
}
