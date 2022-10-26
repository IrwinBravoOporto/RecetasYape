//
//  HomeViewTests.swift
//  RecetasYapeTests
//
//  Created by Irwin Bravo Oporto on 26/10/22.
//

import XCTest
@testable import RecetasYape

class HomeViewTests: XCTestCase {
    
    //SUT: Sytem Urden Test Home
    var sutHome : HomeViewController!
    var valueValidation = false
    var valueCount = false

    override func setUpWithError() throws {
        sutHome = HomeViewController()
     }

    override func tearDownWithError() throws {
        sutHome = nil
     }

    func testHome_FoodListCount() {
        
        let result = sutHome.testUnitNumber(a: 0, b: 5)
        XCTAssertEqual(result, 5)
        XCTAssertNotEqual(result, 10)
        
        let resultTwo =  sutHome.getCountListFood(newNalue: 7)
        XCTAssertTrue(resultTwo)
        
    }
}

