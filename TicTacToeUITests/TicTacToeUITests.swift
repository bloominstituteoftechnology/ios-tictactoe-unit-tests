//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Josh Kocsis on 7/29/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {

    var app = XCUIApplication()

    func testExample() throws {

        playerXWin(elementIdentifiers: [
            "topMiddle",
            "topLeft",
            "middleCenter",
            "middleLeft",
            "bottomMiddle"
        ])
    }

    func testMiddleHorizontalWin() {

        playerXWin(elementIdentifiers: [
            "middleLeft",
            "topLeft",
            "middleCenter",
            "topMiddle",
            "middleRight"
        ])
    }
}

extension TicTacToeUITests {

    func launch() {
        app.launch()
    }

    func play(elements: [XCUIElement]) {
        for element in elements {
            element.tap()
        }
    }

    func compareWinCondition(playerString: String) {
        let statusLabel: XCUIElement = app.staticTexts["statusLabel"]

        XCTAssertEqual(statusLabel.label, playerString)
    }

    func playerXWin(elementIdentifiers: [String]) {
        launch()

        let elements = elementIdentifiers.map  { app.buttons[$0] }

        play(elements: elements)

        compareWinCondition(playerString: "Player X won!")
    }
}
