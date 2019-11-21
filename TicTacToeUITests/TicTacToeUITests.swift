//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by John Kouris on 11/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class TicTacToeUITests: XCTestCase {

    func testLeftVertical() {
        let app = XCUIApplication()
        app.launch()
        
        // Tap "X" on the top left.
        app.assertMovePlayed(.topLeft,
                             buttonLabelAssertion: .X,
                             statusLabelAssertionString: "Player O's turn")
        
        // Tap "O" on the top right
        app.assertMovePlayed(.topRight,
                             buttonLabelAssertion: .O,
                             statusLabelAssertionString: "Player X's turn")
        
        // Tap "X" on the middle left.
        let middleLeftButton = app.buttons["middleLeft"]
        middleLeftButton.tap()
        XCTAssertEqual(middleLeftButton.label, "X")
//        XCTAssertEqual(statusLabel.label, "Player O's turn")
        
        // Tap "O" on the middle right
        let middleRightButton = app.buttons["middleRight"]
        middleRightButton.tap()
        XCTAssertEqual(middleRightButton.label, "O")
//        XCTAssertEqual(statusLabel.label, "Player X's turn")
        
        // Tap "X" on the bottom left.
        let bottomLeftButton = app.buttons["bottomLeft"]
        bottomLeftButton.tap()
        XCTAssertEqual(bottomLeftButton.label, "X")
//        XCTAssertEqual(statusLabel.label, "Player X won!")
        
    }
    
    func testDiagonal() {
        let app = XCUIApplication()
        app.launch()
        
        // x starts the game.
//        let statusLabel = app.staticTexts["status"]
        
        // Tap "X" on the top left.
        let topLeftButton = app.buttons["topLeft"]
        topLeftButton.tap()
        XCTAssertEqual(topLeftButton.label, "X")
        
        // Tap "O" on top right.
        let topRightButton = app.buttons["topRight"]
        topRightButton.tap()
        XCTAssertEqual(topRightButton.label, "O")
        
        // Tap "X" on middle center.
        let middleCenterButton = app.buttons["middleCenter"]
        middleCenterButton.tap()
        XCTAssertEqual(middleCenterButton.label, "X")
        
        // Tap "O" on middle right.
        let middleRightButton = app.buttons["middleRight"]
        middleRightButton.tap()
        XCTAssertEqual(middleRightButton.label, "O")
        
        // Tap "X" on bottom right.
        let bottomRightButton = app.buttons["bottomRight"]
        bottomRightButton.tap()
        XCTAssertEqual(bottomRightButton.label, "X")
    }
    
}

extension XCUIApplication {
    
    func assertMovePlayed(_ buttonIdentifier: PositionIdentifier,
                          buttonLabelAssertion: ButtonLabel,
                          statusLabelAssertionString: String) {
        let button = buttons[buttonIdentifier.rawValue]
        button.tap()
        XCTAssertEqual(button.label, buttonLabelAssertion.rawValue)
//        XCTAssertEqual(statusElement.label, statusLabelAssertionString)
    }
    
    var statusElement: XCUIElement {
        return staticTexts["status"]
    }
    
    enum PositionIdentifier: String {
        case topLeft
        case topRight
        case topCenter
        case middleLeft
        case middleRight
        case middleCenter
        case bottomLeft
        case bottomRight
        case bottomCenter
    }
    
    enum ButtonLabel: String {
        case X
        case O
    }
    
}
