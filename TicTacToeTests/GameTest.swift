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
	
	
	func testWinCheckingVertical1_Simulation() {
		/*
		x o -
		x o -
		- o x
		*/
		
		var game = Game(board: GameBoard())
		//		GameAITests().testWinCheckingVertical1()
		
		XCTAssertNoThrow(try game.makeMark(at: (0,0)))
		XCTAssertNoThrow(try game.makeMark(at: (1,0)))
		XCTAssertNoThrow(try game.makeMark(at: (0,1)))
		XCTAssertNoThrow(try game.makeMark(at: (1,1)))
		XCTAssertNoThrow(try game.makeMark(at: (0,2)))
		XCTAssertTrue(game.gameState == .won(.x))

		game.board.printArrToConsole()
	}
	
	func testWinCheckingVertical2_Simulation() {
		/*
		x o -
		x o -
		- o x
		*/
		
		var game = Game(board: GameBoard())
		//GameAITests().testWinCheckingVertical2()
		
		XCTAssertNoThrow(try game.makeMark(at: (0,0)))
		XCTAssertNoThrow(try game.makeMark(at: (1,0)))
		XCTAssertNoThrow(try game.makeMark(at: (0,1)))
		XCTAssertNoThrow(try game.makeMark(at: (1,1)))
		XCTAssertNoThrow(try game.makeMark(at: (2,2)))
		XCTAssertNoThrow(try game.makeMark(at: (1,2)))
		XCTAssertTrue(game.gameState == .won(.o))
		
		game.board.printArrToConsole()
	}
	
	func testWinCheckingHorizontal1_Simulater() {
		/*
		- o -
		x x x
		o - -
		*/
		
		var game = Game(board: GameBoard())
		//GameAITests().testWinCheckingHorizontal1()
		
		XCTAssertNoThrow(try game.makeMark(at: (0,1)))
		XCTAssertNoThrow(try game.makeMark(at: (1,0)))
		XCTAssertNoThrow(try game.makeMark(at: (1,1)))
		XCTAssertNoThrow(try game.makeMark(at: (0,2)))
		XCTAssertNoThrow(try game.makeMark(at: (2,1)))
		XCTAssertTrue(game.gameState == .won(.x))
		
		game.board.printArrToConsole()
	}
	
	func testWinCheckingHorizontal2_Simulater() {
		/*
		x - -
		- x -
		o o o
		*/
		
		var game = Game(board: GameBoard())
		//GameAITests().testWinCheckingHorizontal2()
		
		XCTAssertNoThrow(try game.makeMark(at: (0,0)))
		XCTAssertNoThrow(try game.makeMark(at: (0,2)))
		XCTAssertNoThrow(try game.makeMark(at: (1,1)))
		XCTAssertNoThrow(try game.makeMark(at: (1,2)))
		XCTAssertNoThrow(try game.makeMark(at: (2,2)))
		XCTAssertTrue(game.gameState == .won(.x))
		
		game.board.printArrToConsole()
	}
	
	func testWinCheckingDiagonal1_Simulater() {
		/*
		x - -
		- x -
		o o x
		*/
		
		var game = Game(board: GameBoard())
		//GameAITests().testWinCheckingDiagonal1()

		XCTAssertNoThrow(try game.makeMark(at: (0,0)))
		XCTAssertNoThrow(try game.makeMark(at: (0,2)))
		XCTAssertNoThrow(try game.makeMark(at: (1,1)))
		XCTAssertNoThrow(try game.makeMark(at: (1,2)))
		XCTAssertNoThrow(try game.makeMark(at: (2,2)))
		XCTAssertTrue(game.gameState == .won(.x))

		game.board.printArrToConsole()
	}
}
