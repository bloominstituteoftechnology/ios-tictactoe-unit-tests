//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Fernando Olivares on 27/05/20.
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
		let topLeftButton = app.buttons["com.tictactoe.board.topLeft"]
		topLeftButton.tap()
		
		// To prove that something is true, use an XCTAssert.
		// If it isn't true, then stop execution and fail the test.
		// Message is why you failed the test.
		// XCTAssert(true, "The symbol is not X")
		
		// Test that it's O player's turn.
		let statusLabel = app.staticTexts["com.tictactoe.turnPlayer"]
		XCTAssert(statusLabel.label == "Player O's turn", "Next player is incorrect")
		
		// Test that the button has an X in it.
		XCTAssertEqual(topLeftButton.label, "X")
    }
	
	func testTie() {
		
		let app = XCUIApplication()
		app.launch()
		
		let moves = [
			"com.tictactoe.board.topLeft",
			"com.tictactoe.board.bottomRight",
			"com.tictactoe.board.middleCenter",
			"com.tictactoe.board.middleLeft",
			"com.tictactoe.board.middleRight",
			"com.tictactoe.board.topRight",
			"com.tictactoe.board.bottomLeft",
			"com.tictactoe.board.bottomCenter",
		]
		
		// Who begins playing? X
		// What index is the first move? Index 0
		for (index, move) in moves.enumerated() {
			
			// Modulo operation.
			// Remainder of diving a number by another number.
			// Divide index by 2, if the reminder is 0, even
			// Divide index by 2, if the reminder is 1, odd
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
		
		// It's player's O/X turn now.
		validateMove(identifier: "com.tictactoe.board.topCenter",
					 expectedButtonLabel: "X")

		validateStatusLabel(expectedString: "Cat's game!")
	}
	
	func validatePlacement(identifier: String,
						   expectedButtonLabel: String) {
		
		// The button received an X/O
		validateMove(identifier: identifier,
					 expectedButtonLabel: expectedButtonLabel)
		
		let nextPlayer: String
		if expectedButtonLabel == "X" {
			nextPlayer = "O"
		} else {
			nextPlayer = "X"
		}
		
		// It's player's O/X turn now.
		validateStatusLabel(expectedString: "Player \(nextPlayer)'s turn")
	}
	
	func validateMove(identifier: String, expectedButtonLabel: String) {
		let tappedButton = app.buttons[identifier]
		tappedButton.tap()
		XCTAssertEqual(tappedButton.label, expectedButtonLabel)
	}
	
	func validateStatusLabel(expectedString: String) {
		let statusLabel = app.staticTexts["com.tictactoe.turnPlayer"]
		XCTAssert(statusLabel.label == expectedString, "Next player is incorrect")
	}
}
