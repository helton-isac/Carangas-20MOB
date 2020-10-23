//
//  CarAPIStub.swift
//  CarangasTests
//
//  Created by Helton Isac Torres Galindo on 22/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation
@testable import Carangas

class CarAPIStub: NSObject, CarAPIProtocol {
    
    func loadCars(onComplete: @escaping (Result<[Car], APIError>) -> Void) {
        var cars: [Car] = []
        let url = Bundle(for: CarAPIStub.self).url(forResource: "CarsMocked", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        cars = try! JSONDecoder().decode([Car].self, from: data)
        onComplete(.success(cars))
    }
    
    func deleteCar(_ car: Car, onComplete: @escaping (Result<Void, APIError>) -> Void) {
        onComplete(.success(()))
    }

}
