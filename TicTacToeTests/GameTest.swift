//
//  GameTest.swift
//  TicTacToeTests
//
//  Created by Hector Steven on 6/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTest: XCTestCase {
	
	func testrestart() {
		var game = Game(board: GameBoard())
		game.restart()
		XCTAssertTrue(game.activePlayer == .x)
		XCTAssertFalse(game.gameIsOver)
		XCTAssertNil(game.winningPlayer)
		XCTAssertTrue(game.getGameState == Game.GameState.active(.x))
	}

	func testMakeMark() {
		var game = Game(board: GameBoard())
		
		// for x
		let cordinate0 = (0,0)
		XCTAssertNoThrow(try game.makeMark(at: cordinate0))
		XCTAssertTrue(game.board[cordinate0]! == .x)
		XCTAssertTrue(game.activePlayer == .o)

		// for y
		let cordinate1 = (0,1)
		XCTAssertNoThrow(try game.makeMark(at: cordinate1))
		XCTAssertTrue(game.board[cordinate1]! == .o)
		XCTAssertTrue(game.activePlayer == .x)
		game.board.printArrToConsole()
	}
	
	func testWinCheckingVertical1Simulation() {
		GameAITests().testWinCheckingVertical1()
		
		/*
		x o -
		x o -
		x - -
		*/
		
		
	}
	
}
