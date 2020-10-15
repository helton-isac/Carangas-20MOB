//
//  CarsTableViewController.swift
//  Carangas
//
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarsTableViewController: UITableViewController {
    
    // MARK: - Properties
    var viewModel = CarsListingViewModel()
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.carsDidUpdate = carsDidUpdate
        refreshControl?.addTarget(self, action: #selector(loadCars), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCars()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CarViewController, let row = tableView.indexPathForSelectedRow?.row {
            vc.car = cars[row]
        }
    }
    
    // MARK: - Methods
    @objc private func loadCars() {
        viewModel.loadCars()
    }
    
    private func carsDidUpdate() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CarTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: viewModel.cellViewModelFor(indexPath))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteCar(at: indexPath) { (result) in
                switch result {
                case .success:
                    break
                case .failure(let apiError):
                    DispatchQueue.main.async {
                        Alert.show(title: "Erro",
                                   message: "Não foi possível excluir o carro. Motivo: \(apiError.errorMessage)",
                                   presenter: self)
                    }
                }
            }
        }
    }
}
