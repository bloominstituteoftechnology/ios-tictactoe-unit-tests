//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Bobby Keffury on 11/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

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
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // X Starts the game
        let statusLabel = app.staticTexts["status"]
        
        app.assertMovePlayed(.topLeft, buttonLabelAssertionString: .X, nextPlayerAssertionString: .O)
        app.assertMovePlayed(.topRight, buttonLabelAssertionString: .O, nextPlayerAssertionString: .X)
        app.assertMovePlayed(.middleLeft, buttonLabelAssertionString: .X, nextPlayerAssertionString: .O)
        app.assertMovePlayed(.middleCenter, buttonLabelAssertionString: .O, nextPlayerAssertionString: .X)
        
        // This is the winning move.
        let bottomLeftButton = app.buttons["bottomLeft"]
        bottomLeftButton.tap()
        XCTAssertEqual(bottomLeftButton.label, "X")
        
        XCTAssertEqual(statusLabel.label, "Player X won!")
        
    }
    
    
    func testDiagonal() {
        
        let app = XCUIApplication()
        app.launch()
        
        // X Starts the game
        let statusLabel = app.staticTexts["status"]
        
        // DRY - Don't repeat yourself.
        
        // Tap "X" on the top left
        app.assertMovePlayed(.topLeft, buttonLabelAssertionString: .X, nextPlayerAssertionString: .O)
        
        // Tap "O" on the top center
        app.assertMovePlayed(.topCenter, buttonLabelAssertionString: .O, nextPlayerAssertionString: .X)
        
        // Tap "X" on the middle left
        app.assertMovePlayed(.middleCenter, buttonLabelAssertionString: .X, nextPlayerAssertionString: .O)
        
        // Tap "O" on the middle right
        app.assertMovePlayed(.middleRight, buttonLabelAssertionString: .O, nextPlayerAssertionString: .X)
        
        // Tap "X" on the bottom right
        let bottomRightButton = app.buttons["bottomRight"]
        bottomRightButton.tap()
        XCTAssertEqual(bottomRightButton.label, "X")
        
        XCTAssertEqual(statusLabel.label, "Player X won!")

    }

}

extension XCUIApplication {
    
    enum PositionIdentifier: String {
        case topLeft
        case topCenter
        case topRight
        case middleLeft
        case middleCenter
        case middleRight
        case bottomLeft
        case bottomMiddle
        case bottomRight
    }
    
    enum ButtonLabel: String {
        case X
        case O
    }
    
    var statusElement: XCUIElement {
        return staticTexts["status"]
    }
    
    func assertMovePlayed(_ buttonIdentifier: PositionIdentifier, buttonLabelAssertionString: ButtonLabel, nextPlayerAssertionString: ButtonLabel) {
        
        let button = buttons[buttonIdentifier.rawValue]
        button.tap()
        XCTAssertEqual(button.label, buttonLabelAssertionString.rawValue)
        XCTAssertEqual(statusElement.label, "Player \(nextPlayerAssertionString.rawValue)'s turn")
        
    }
}
