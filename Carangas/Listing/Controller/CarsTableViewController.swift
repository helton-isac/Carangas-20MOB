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
        
        //GEITO VIDA LOKA
//        URLSession.shared.dataTask(with: URL(string: "https://carangas.herokuapp.com/cars")!) { (data, _, _) in
//            self.cars = try! JSONDecoder().decode([Car].self, from: data!)
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }.resume()
        
        CarAPI().loadCars { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let cars):
                self.cars = cars
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let apiError):
                switch apiError {
                case .badURL:
                    print("Bad URL")
                case .decodeError:
                    print("Error Decoding Response")
                case .invalidStatusCode(let statusCode):
                    print("Invalid Status Code: \(statusCode)")
                case .noData:
                    print("No Data")
                case .noResponse:
                    print("No Response")
                case .taskError:
                    print("Task Error")
                }
            }
        }
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
