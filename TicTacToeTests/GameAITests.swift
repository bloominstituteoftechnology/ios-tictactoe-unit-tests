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
		
//		board.printArrToConsole()

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
		
//		board.printArrToConsole()
		
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal1() {
        /*
         - o -
         x x x
         o - -
         */
		var board = GameBoard()
		
		XCTAssertNoThrow(try board.place(mark: .o, on: (1, 0)))
		XCTAssertNoThrow(try board.place(mark: .o, on: (0, 2)))
		
		XCTAssertNoThrow(try board.place(mark: .x, on: (0, 1)))
		XCTAssertNoThrow(try board.place(mark: .x, on: (1, 1)))
		XCTAssertNoThrow(try board.place(mark: .x, on: (2, 1)))
		
		board.printArrToConsole()
		
		XCTAssertTrue(game(board: board, isWonBy: .x))
		XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal2() {
        /*
         x - -
         - x -
         o o o
         */
		
		var board = GameBoard()
		
		XCTAssertNoThrow(try board.place(mark: .o, on: (0, 2)))
		XCTAssertNoThrow(try board.place(mark: .o, on: (1, 2)))
		XCTAssertNoThrow(try board.place(mark: .o, on: (2, 2)))
		
		XCTAssertNoThrow(try board.place(mark: .x, on: (0, 0)))
		XCTAssertNoThrow(try board.place(mark: .x, on: (1, 1)))
		
		
		board.printArrToConsole()
		
		XCTAssertTrue(game(board: board, isWonBy: .o))
		XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingDiagonal1() {
        /*
         x - -
         - x -
         o o x
         */
		
		var board = GameBoard()
		
		XCTAssertNoThrow(try board.place(mark: .o, on: (0, 2)))
		XCTAssertNoThrow(try board.place(mark: .o, on: (2, 1)))
		
		XCTAssertNoThrow(try board.place(mark: .x, on: (0, 0)))
		XCTAssertNoThrow(try board.place(mark: .x, on: (1, 1)))
		XCTAssertNoThrow(try board.place(mark: .x, on: (2, 2)))
		
		
		board.printArrToConsole()
		
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
    }
    
    func testIncompleteGame() {
    }

    func testCatsGame() {
    }
}
