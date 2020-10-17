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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
}
