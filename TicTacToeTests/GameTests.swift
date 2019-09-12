//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Jeffrey Santana on 9/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

	func testRestartBoardToEmpty() throws {
		var gamePlay = Game(board: GameBoard())
		
		try gamePlay.placeMark(at: (0,2))
		try gamePlay.placeMark(at: (0,0))
		try gamePlay.placeMark(at: (1,0))
		try gamePlay.placeMark(at: (1,1))
		try gamePlay.placeMark(at: (2,0))
		
		gamePlay.restart()
		
		XCTAssertEqual(.x, gamePlay.activePlayer)
		XCTAssertFalse(gamePlay.gameIsOver)
		XCTAssertFalse(gamePlay.board.isFull)
		XCTAssertNil(gamePlay.winningPlayer)
	}
	
	func testAgainstOverlappingMarks() throws {
		var gamePlay = Game(board: GameBoard())
		
		try gamePlay.placeMark(at: (0,0))
		gamePlay.activePlayer = .o
		try? gamePlay.placeMark(at: (0,0))
		
		XCTAssertEqual(.x, gamePlay.board[(0,0)])
	}
	
	func testRemovingPreviousMark() throws {
		var gamePlay = Game(board: GameBoard())
		
		try gamePlay.placeMark(at: (0,2))
		try gamePlay.placeMark(at: (0,0))
		try gamePlay.placeMark(at: (1,0))
		
		try gamePlay.removeMark()
		
		XCTAssertEqual(.x, gamePlay.activePlayer)
	}

}
