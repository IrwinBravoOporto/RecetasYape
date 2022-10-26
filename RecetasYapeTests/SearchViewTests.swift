//
//  SearchViewTests.swift
//  RecetasYapeTests
//
//  Created by Irwin Bravo Oporto on 26/10/22.
//

import XCTest
@testable import RecetasYape

class SearchViewTests: XCTestCase {
    
    //SUT: Sytem Urden Test Search
    var sutSearch : SearchViewController!
    private var valueValidation = false

    override func setUpWithError() throws {
        sutSearch = SearchViewController()
    }

    override func tearDownWithError() throws {
        sutSearch = nil
    }
    
    func testSearch_FoodListCount() {
        
        let result = sutSearch.testUnitNumber(a: 0, b: 5)
        valueValidation = (result > 0) ? true : false
        XCTAssertTrue(valueValidation)
        
        let resultTwo =  sutSearch.getCountListFood(newNalue: 7)
        XCTAssertTrue(resultTwo)
    }

}
