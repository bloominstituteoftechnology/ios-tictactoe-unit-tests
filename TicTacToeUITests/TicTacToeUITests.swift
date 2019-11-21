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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLeftVertical() {
        let app = XCUIApplication()
        app.launch()
        
        // x starts the game.
        let statusLabel = app.staticTexts["status"]
        
        // Tap "X" on the top left.
        self.assertMovePlayed(app: app,
                              statusLabel: statusLabel,
                              buttonIdentifier: .topLeft,
                              buttonLabelAssertionString: "X",
                              statusLabelAssertionString: "Player O's turn")
        
        // Tap "O" on the top right
        let topRightButton = app.buttons["topRight"]
        topRightButton.tap()
        XCTAssertEqual(topRightButton.label, "O")
//        XCTAssertEqual(statusLabel.label, "Player X's turn")
        
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
    
    func assertMovePlayed(app: XCUIApplication,
                          statusLabel: XCUIElement,
                          buttonIdentifier: PositionIdentifier,
                          buttonLabelAssertionString: String,
                          statusLabelAssertionString: String) {
        let button = app.buttons[buttonIdentifier.rawValue]
        button.tap()
        XCTAssertEqual(button.label, buttonLabelAssertionString)
//        XCTAssertEqual(statusLabel.label, statusLabelAssertionString)
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
    
}
