//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Thomas Dye on 5/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }

    func testFirstXMark() throws {
        
        // UI tests must launch the application that they test.
      let app = XCUIApplication()
      app.launch()
        
        // Tap to generate an X
        let topLeftCorner = app.buttons["topLeftCorner"]
        topLeftCorner.tap()
        
        // To prove that something is true.
        // If it isn't true, then stop execution and fail the test.
        // Message is why you failed the test.
        // XCTAssert(true, "The symbol is not X")
        
        // Test that it's O player's turn.
        let statusLabel = app.staticTexts["com.tictactoe.turnPlayer"]
        XCTAssert(statusLabel.label == "Player O's turn", "Next player is incorrect")
        
        // Test that the button has an X in it.
        XCTAssertEqual(topLeftCorner.label, "X")
        
        
    }

    func testTie() {
        let app = XCUIApplication()
        
        app.launch()
        
        let moves = [
            "topLeftCorner",
            "bottomRightCorner",
            "middleCenter",
            "middleLeft",
            "middleRight",
            "topRightCorner",
            "bottomLeftCorner",
            "bottomCenter"
        ]
        
        // Who begins playing? X
        // What index is the first move? Index 0
        for (index, move) in moves.enumerated() {
            
            // Modulo operation.
            // Remainder of dividing a number by another number.
            // Divide index by 2, if the remainder is 0, even
            // Divide index by 2, if the remainder is 1, odd
            let expectedLabel: String
            
            if (index % 2) == 0 {
                // Even
                expectedLabel = "X"
            } else {
                // Odd
                expectedLabel = "O"
            }
            validatePlacement(identifier: move,
                              expectedButtonLabel: expectedLabel)
        }
        
        validateMove(identifier: "topCenter", expectedButtonLabel: "X")
        
        validateStatusLabel(expectedString: "Cat's game!")
        
    }
    
    func validatePlacement(identifier: String,
                           expectedButtonLabel: String) {
        
        validateMove(identifier: identifier,
                     expectedButtonLabel: expectedButtonLabel)
        
        let nextPlayer: String
        if expectedButtonLabel == "X" {
            nextPlayer = "O"
        } else {
            nextPlayer = "X"
        }
        
        // It's player X/O's turn now
        validateStatusLabel(expectedString: "Player \(nextPlayer)'s turn")
        
        
    }
    
    func validateMove(identifier: String, expectedButtonLabel: String) {
        
        // The topLeft button received an X/O
        let tappedButton = app.buttons[identifier]
        tappedButton.tap()
        XCTAssertEqual(tappedButton.label, expectedButtonLabel)
    }
    
    func validateStatusLabel(expectedString: String) {
        
        let statusLabel = app.staticTexts["com.tictactoe.turnPlayer"]
        XCTAssert(statusLabel.label == expectedString, "Next player is incorrect")
    }
}
