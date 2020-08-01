//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Morgan Smith on 7/29/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {

    var app = XCUIApplication()

    func launch() -> XCUIApplication {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        return app
    }

    // tap the elements in the array
    func play(elements: [XCUIElement]) {
        // need a reference to a bunch of buttons
        // tap the buttons in the correct order
        for element in elements {
            element.tap()
        }
    }

    func compareWinCondition(playerString: String) {
        let statusLabel: XCUIElement = app.staticTexts["statusLabel"]
        XCTAssertEqual(statusLabel.label, playerString)
    }

    func testExample() throws {
        let app = launch()

        // Use recording to get started writing UI tests.
         // Use XCTAssert and related functions to verify your tests produce the correct results.
        // you dont get access to anything related to UIkit, only access XCUIElement, accesibility
        // need accessibility identifier so code isnt extensive
        // static text is the same as a UILabel
        /*
        play(elements: [
            app.buttons["topLeftButton"],
            app.buttons["middleLeftButton"],
            app.buttons["middleCenterButton"],
            app.buttons["bottomLeftButton"],
            app.buttons["bottomRightCenter"]
        ])

        compareWinCondition(playerString: "Player X won!")
      // let statusLabel = app.staticTexts["statusLabel"]
      //  XCTAssertEqual(statusLabel.label, "Player X won!")
*/
        playerXWin(elementIdentifiers: [
            "topLeftButton",
            "middleLeftButton",
            "middleCenterButton",
            "bottomLeftButton",
            "bottomRightCenter"])
    }

    func testMiddleHorizonalWin() {
        let app = launch()

        app/*@START_MENU_TOKEN@*/.staticTexts["Restart"]/*[[".buttons[\"Restart\"].staticTexts[\"Restart\"]",".staticTexts[\"Restart\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["topLeftButton"].staticTexts[" "].tap()
        app.buttons["middleLeftButton"].tap()
        app.buttons["bottomLeftButton"].staticTexts[" "].tap()
        app.buttons["middleCenterButton"].tap()
        app.buttons["topMiddleButton"].staticTexts[" "].tap()
        app.buttons["middleRightButton"].tap()

        let statusLabel = app.staticTexts["statusLabel"]
        XCTAssertEqual(statusLabel.label, "Player O won!")

    }

    func playerXWin(elementIdentifiers: [String]) {
        let app = launch()
      //  let elements = elementIdentifiers.map { elementInElementIdentifiers -> XCUIElement in return app.buttons[elementInElementIdentifiers]
       // }
        let elements = elementIdentifiers.map { app.buttons[$0]}
        play(elements: elements)
        compareWinCondition(playerString: "Player X won!")
    }
}
