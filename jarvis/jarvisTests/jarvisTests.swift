//
//  jarvisTests.swift
//  jarvisTests
//
//  Created by Joao Luis Vazao Vasques on 27/02/16.
//  Copyright © 2016 xyz.joaovasques. All rights reserved.
//

import XCTest
@testable import jarvis

class jarvisTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testIntegrationInitiation() {
        let fitbitIntegration = Integration(name: "Fitbit", photo: UIImage(named: "Fitbit")!, selected: false)
        XCTAssertNotNil(fitbitIntegration)
    }
    
}
