//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Kenneth Jones on 9/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        
        let app = XCUIApplication()
        app.buttons["button0"].tap()
        app.buttons["button1"].tap()
        app.buttons["button3"].tap()
        app.buttons["button4"].tap()
        app.buttons["button6"].tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
