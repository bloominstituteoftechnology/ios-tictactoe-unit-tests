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
		XCTAssertTrue(game.winningPlayer == nil)
		XCTAssertTrue(game.getGameState()! == Game.GameState.active(.x))
	}

}
