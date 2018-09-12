//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by William Bundy on 9/12/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

typealias Mark = GameBoard.Mark
class GameBoardTests: XCTestCase {

	func testEmptyBoardCreation()
	{
		let board = GameBoard()
		XCTAssertFalse(board.isFull)
		for i in 0..<9 {
			XCTAssertNil(board[i])
		}
	}

	func testPlacingMark()
	{
		var board = GameBoard()

		XCTAssertNoThrow(try board.place(mark: .x, on: (0, 1)))
		XCTAssertEqual(board[(0, 1)], .x)
	}

	func testFillingBoard() {
		var board = GameBoard()
		for y in 0..<3 {
			for x in 0..<3 {
				XCTAssertFalse(board.isFull)
				try! board.place(mark: .x, on:(x, y))
			}
		}
		XCTAssertTrue(board.isFull)
	}
}
