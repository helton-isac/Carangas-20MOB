//
//  CarangasTests.swift
//  CarangasTests
//
//  Created by Helton Isac Torres Galindo on 22/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import XCTest

class CarangasTests: XCTestCase {
    
    var viewModel: String!
    
    var number = 1;
    
    override class func setUp() {
        print("setUp")
    }
    
    override func setUpWithError() throws {
        print("setUpWithError")
    }
    
    override func setUp() {
        print("setUp 2")
    }
    
    override func tearDown() {
        print("tearDown 2")
    }
    
    override func tearDownWithError() throws {
        print("tearDownWithError")
    }
    
    override class func tearDown() {
        print("tearDown")
    }
    

    






    func testExample() throws {
        print("testExample")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            print("testPerformanceExample")
        }
    }

}
