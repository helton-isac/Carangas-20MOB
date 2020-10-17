//
//  CarsListingCoordinator.swift
//  Carangas
//
//  Created by Helton Isac Torres Galindo on 17/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarsListingCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinators: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = CarsListingViewController.instantiateFromStoryboard(.listing)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension CarsListingCoordinator : CarPresenter {
    func showCarWith(viewModel: CarVisualizationViewModel) {
        let childCoordinator = CarVisualizationCoordinator(
            navigationController: navigationController,
            carVisualizationViewModel: viewModel)
        childCoordinator.parentCoordinators = self
        childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }
}

extension CarsListingCoordinator : CarCreator {
    func createCar(viewModel: CarFormViewModel = CarFormViewModel()) {
        let viewController = CarFormViewController.instantiateFromStoryboard(.form)
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}
