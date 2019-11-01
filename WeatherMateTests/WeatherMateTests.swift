//
//  WeatherMateTests.swift
//  WeatherMateTests
//
//  Created by Robert Lorentz on 2019-10-28.
//  Copyright © 2019 Robert Lorentz. All rights reserved.
//

import XCTest
@testable import WeatherMate

class WeatherMateTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        OpenWeatherMapAPI.getWeatherForecasts(id: "524901").done { (forecasts) in
            
        }
        
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
