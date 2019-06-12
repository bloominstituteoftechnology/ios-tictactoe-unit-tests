//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testWinCheck() {
        /*
        x o -
        x o -
        x - -
        */

		var game = Game()
		XCTAssertNotNil(game.activePlayer, "\(game)")
		try! game.makeMark(at: (0,0))
		XCTAssertNil(game.winningPlayer)
		XCTAssertFalse(game.gameIsOver)
		try! game.makeMark(at: (1,0))
		XCTAssertNil(game.winningPlayer)
		XCTAssertFalse(game.gameIsOver)
		try! game.makeMark(at: (0,1))
		XCTAssertNil(game.winningPlayer)
		XCTAssertFalse(game.gameIsOver)
		try! game.makeMark(at: (1,1))
		XCTAssertNil(game.winningPlayer)
		XCTAssertFalse(game.gameIsOver)
		try! game.makeMark(at: (0,2))
		XCTAssert(game.winningPlayer == .x, "\(game)")
		XCTAssertTrue(game.gameIsOver)


	}
    
	func testTieCheck() {

		var game = Game()
		/*
		o x x
		x x o
		o o x
		*/

		try! game.makeMark(at: (1,0)) //x
		try! game.makeMark(at: (0,0)) //o
		try! game.makeMark(at: (2,0)) //x
		try! game.makeMark(at: (2,1)) //o
		try! game.makeMark(at: (0,1)) //x
		try! game.makeMark(at: (0,2)) //o
		try! game.makeMark(at: (1,1)) //x
		try! game.makeMark(at: (1,2)) //o
		try! game.makeMark(at: (2,2)) //x
		XCTAssertNil(game.winningPlayer, "\(game)")
		XCTAssertTrue(game.gameIsOver)
    }
    
    func testGameOverNoMoreMarks() {
		/*
		x o -
		x o -
		x - -
		*/

		var game = Game()
		try! game.makeMark(at: (0,0))
		try! game.makeMark(at: (1,0))
		try! game.makeMark(at: (0,1))
		try! game.makeMark(at: (1,1))
		try! game.makeMark(at: (0,2))

		XCTAssertThrowsError(try game.makeMark(at: (2,0)))
		XCTAssertThrowsError(try game.makeMark(at: (2,1)))
		XCTAssertThrowsError(try game.makeMark(at: (2,1)))
		XCTAssertThrowsError(try game.makeMark(at: (1,2)))
	}
    
    func testNoRepeatMarks() {
		/*
		x o -
		x o -
		x - -
		*/

		var game = Game()
		XCTAssertTrue(game.activePlayer == .x, "\(game)")
		try! game.makeMark(at: (0,0))
		XCTAssertTrue(game.activePlayer == .o, "\(game)")

		XCTAssertThrowsError(try game.makeMark(at: (0,0)))
		XCTAssertTrue(game.activePlayer == .o, "\(game)")
		try! game.makeMark(at: (0,1))
		XCTAssertTrue(game.activePlayer == .x, "\(game)")
		XCTAssertThrowsError(try game.makeMark(at: (0,0)))
		XCTAssertTrue(game.activePlayer == .x, "\(game)")

    }
}
