//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by William Bundy on 9/12/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

import Foundation
@testable import TicTacToe

class GameAITests: XCTestCase {
	func testAIDisruption()
	{
		var board = GameBoard()
		try! board.place(mark: .x, at: 0)
		try! board.place(mark: .x, at: 3)
		XCTAssert(nextMove(board, for: .x) == 6)
		XCTAssert(nextMove(board, for: .o) == 6)

		board = GameBoard()
		try! board.place(mark: .x, at: 0)
		try! board.place(mark: .x, at: 4)
		XCTAssert(nextMove(board, for: .x) == 8)
		XCTAssert(nextMove(board, for: .o) == 8)

		board = GameBoard()
		try! board.place(mark: .x, at: 0)
		try! board.place(mark: .x, at: 1)
		XCTAssert(nextMove(board, for: .x) == 2)
		XCTAssert(nextMove(board, for: .o) == 2)

	}

	func testAllWins() {
		for (player,enemy) in [(Mark.x, Mark.o), (Mark.o, Mark.x)] {
			// rows
			for y in 0...2 {
				var board = GameBoard()
				for x in 0...2 {
					try! board.place(mark: player, on: (x, y))
				}
				XCTAssertTrue(gameWon(board: board, by: player))
				XCTAssertFalse(gameWon(board: board, by: enemy))
			}

			// columns
			for x in 0...2 {
				var board = GameBoard()
				for y in 0...2 {
					try! board.place(mark: player, on: (x, y))
				}
				XCTAssertTrue(gameWon(board: board, by: player))
				XCTAssertFalse(gameWon(board: board, by: enemy))
			}

			// diags
			let diagCases = [
				[(0, 0), (1, 1), (2, 2)],
				[(2, 0), (1, 1), (0, 2)]]
			for win in diagCases {
				var board = GameBoard()
				for pos in win {
					try! board.place(mark: player, on: pos)
				}
				XCTAssertTrue(gameWon(board: board, by: player))
				XCTAssertFalse(gameWon(board: board, by: enemy))
			}
		}
	}
}
