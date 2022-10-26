//
//  RecetasYapeUITests.swift
//  RecetasYapeUITests
//
//  Created by Irwin Bravo Oporto on 25/10/22.
//

import XCTest

class RecetasYapeUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }


    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        let titleHome = app.staticTexts["Recetas Peruanas"]
        XCTAssertTrue(titleHome.exists, "Recetas Peruanas text not found")
        
        let titlePizza = app.staticTexts["Pizza"]
        XCTAssertTrue(titlePizza.exists, "Pizza text not found")
        
        let titlePoutine = app.staticTexts["Poutine"]
        XCTAssertTrue(titlePoutine.exists, "Poutine text not found")
        
        let titleLasagna = app.staticTexts["Lasagna"]
        XCTAssertTrue(titleLasagna.exists, "Lasagna text not found")
        
        let titleTiramisu = app.staticTexts["Tiramisú"]
        XCTAssertTrue(titleTiramisu.exists, "Tiramisú text not found")
        
        let titleSashimi = app.staticTexts["Sashimi"]
        XCTAssertTrue(titleSashimi.exists, "Sashimi text not found")
        
        let titlePure = app.staticTexts["Pure de papas"]
        XCTAssertTrue(titlePure.exists, "Pure de papas text not found")
        
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
