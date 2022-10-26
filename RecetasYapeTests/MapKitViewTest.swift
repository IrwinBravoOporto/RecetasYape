//
//  MapKitViewTest.swift
//  RecetasYapeTests
//
//  Created by Irwin Bravo Oporto on 26/10/22.
//

import XCTest
@testable import RecetasYape

class MapKitViewTest: XCTestCase {
    
    //SUT: Sytem Urden Test Home
    var sutMap : MapKitViewController!

    override func setUpWithError() throws {
        sutMap = MapKitViewController()
     }

    override func tearDownWithError() throws {
        sutMap = nil
     }

    func testMap() {
        
        let result = sutMap.testUnitNumber(a: 0, b: 5)
        XCTAssertEqual(result, 5)
        XCTAssertNotEqual(result, 10)
    }
}
