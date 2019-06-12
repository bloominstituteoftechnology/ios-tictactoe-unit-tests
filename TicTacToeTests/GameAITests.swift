//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    func testWinCheckingVertical1() {
        var board = GameBoard()
        /*
        x o -
        x o -
        x - -
        */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical2() {
        var board = GameBoard()
        /*
         x o -
         x o -
         - o -
         */
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal1() {
        var board = GameBoard()
        /*
         - o -
         x x x
         o - -
         */

		for x in 0...2 {
			try! board.place(mark: .x, on: (x, 1))
		}
		try! board.place(mark: .o, on: (1, 0))
		try! board.place(mark: .o, on: (0, 2))

		XCTAssertTrue(game(board: board, isWonBy: .x))
		XCTAssertFalse(game(board: board, isWonBy: .o))

    }
    
    func testWinCheckingHorizontal2() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o o
         */

		for x in 0...2 {
			try! board.place(mark: .o, on: (x, 2))
		}
		try! board.place(mark: .x, on: (0, 0))
		try! board.place(mark: .x, on: (0, 1))

		XCTAssertTrue(game(board: board, isWonBy: .o))
		XCTAssertFalse(game(board: board, isWonBy: .x))

    }
    
    func testWinCheckingDiagonal1() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o x
         */
		for xy in 0...2 {
			try! board.place(mark: .x, on: (xy, xy))
		}
		try! board.place(mark: .o, on: (1, 2))
		try! board.place(mark: .o, on: (0, 2))

		XCTAssertTrue(game(board: board, isWonBy: .x))
		XCTAssertFalse(game(board: board, isWonBy: .o))

    }
    
    func testWinCheckingDiagonal2() {
        var board = GameBoard()
        /*
         x - o
         - o -
         o x -
         */

		for xy in 0...2 {
			try! board.place(mark: .o, on: (xy, 2 - xy))
		}
		try! board.place(mark: .x, on: (0, 0))
		try! board.place(mark: .x, on: (1, 2))

		XCTAssertTrue(game(board: board, isWonBy: .o))
		XCTAssertFalse(game(board: board, isWonBy: .x))

    }
    
    func testIncompleteGame() {
		var board = GameBoard()
		/*
		x - o
		- o -
		- x o
		*/

		try! board.place(mark: .o, on: (2, 0))
		try! board.place(mark: .x, on: (0, 0))
		try! board.place(mark: .o, on: (1, 1))
		try! board.place(mark: .x, on: (1, 2))
		try! board.place(mark: .o, on: (2, 2))

		XCTAssertFalse(game(board: board, isWonBy: .o))
		XCTAssertFalse(game(board: board, isWonBy: .x))

    }

    func testCatsGame() {
		var board = GameBoard()
		/*
		x o o
		o o x
		x x o
		*/

		try! board.place(mark: .x, on: (0, 0))
		try! board.place(mark: .o, on: (1, 0))
		try! board.place(mark: .o, on: (2, 0))
		try! board.place(mark: .o, on: (0, 1))
		try! board.place(mark: .o, on: (1, 1))
		try! board.place(mark: .x, on: (2, 1))
		try! board.place(mark: .x, on: (0, 2))
		try! board.place(mark: .x, on: (1, 2))
		try! board.place(mark: .o, on: (2, 2))

		XCTAssertFalse(game(board: board, isWonBy: .o))
		XCTAssertFalse(game(board: board, isWonBy: .x))
		XCTAssertTrue(board.isFull)
	}

	func testNilSubscript() {
		let board = GameBoard()

		for x in 0...2 {
			for y in 0...2 {
				XCTAssertNil(board[(x,y)])
			}
		}
	}

	func testMarkString() {
		let markO = GameBoard.Mark.o
		let polX = GameBoard.Mark.x

		XCTAssert(markO.stringValue == "O")
		XCTAssert(polX.stringValue == "X")
	}
}
