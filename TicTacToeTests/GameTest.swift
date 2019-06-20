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
	var game = Game(board: GameBoard())
	
	func testrestart() {
		game.restart()
		XCTAssertTrue(game.activePlayer == .x)
		XCTAssertFalse(game.gameIsOver)
		XCTAssertNil(game.winningPlayer)
		XCTAssertTrue(game.getGameState()! == Game.GameState.active(.x))
	}

	func testMakeMark() {
		let cordinate0 = (0,0)
		XCTAssertNoThrow(try game.makeMark(at: cordinate0))
		XCTAssertTrue(game.board[cordinate0]! == .x)
		print(game.board[(0,0)]!)
		game.board.printArrToConsole()
	}
	
	func testWinCheckingVertical1Simulation() {
		GameAITests().testWinCheckingVertical1()
	}
	
}
