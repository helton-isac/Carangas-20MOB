//
//  CarsTableViewController.swift
//  Carangas
//
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarsTableViewController: UITableViewController {
    // MARK: - Properties
    var cars: [Car] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCars()
    }
    
    // MARK: - Methods
    private func loadCars() {
        CarAPI().loadCars()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let car = cars[indexPath.row]
        cell.textLabel?.text = car.name
        cell.detailTextLabel?.text = car.brand
        return cell
    }
}
