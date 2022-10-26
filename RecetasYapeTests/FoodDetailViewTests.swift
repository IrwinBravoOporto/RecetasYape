//
//  FoodDetailViewTests.swift
//  RecetasYapeTests
//
//  Created by Irwin Bravo Oporto on 26/10/22.
//

import XCTest
@testable import RecetasYape

class FoodDetailViewTests: XCTestCase {
    
    //SUT: Sytem Urden Test Home
    var sutDetail : FoodDetailViewController!

    override func setUpWithError() throws {
        sutDetail = FoodDetailViewController()
     }

    override func tearDownWithError() throws {
        sutDetail = nil
     }

    func testFoodDetail() {
        
        let result = sutDetail.testUnitNumber(a: 0, b: 5)
        XCTAssertEqual(result, 5)
        XCTAssertNotEqual(result, 10)
    }
}
