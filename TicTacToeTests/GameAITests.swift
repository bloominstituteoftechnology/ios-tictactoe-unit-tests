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
        let board = GameBoard()
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
        let board = GameBoard()
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
	
	func testWinCheckingVertical3() throws {
		let board = GameBoard()
		/*
		o - x
		- o x
		- - x
		*/
		try board.place(mark: .x, on: (2,0))
		try board.place(mark: .o, on: (0,0))
		try board.place(mark: .x, on: (2,1))
		try board.place(mark: .o, on: (1,1))
		try board.place(mark: .x, on: (2,2))
		
		XCTAssertTrue(game(board: board, isWonBy: .x))
		XCTAssertFalse(game(board: board, isWonBy: .o))
	}
    
    func testWinCheckingHorizontal1() throws {
		let board = GameBoard()
		/*
		o o o
		- x -
		- x -
		*/
		
		try board.place(mark: .o, on: (0,0))
		try board.place(mark: .x, on: (1,2))
		try board.place(mark: .o, on: (1,0))
		try board.place(mark: .x, on: (1,1))
		try board.place(mark: .o, on: (2,0))
		
		XCTAssertTrue(game(board: board, isWonBy: .o))
		XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal2() throws {
		let board = GameBoard()
		/*
		- o -
		x x x
		o - -
		*/
		
		try board.place(mark: .x, on: (0,1))
		try board.place(mark: .o, on: (0,2))
		try board.place(mark: .x, on: (1,1))
		try board.place(mark: .o, on: (1,0))
		try board.place(mark: .x, on: (2,1))
		
		XCTAssertTrue(game(board: board, isWonBy: .x))
		XCTAssertFalse(game(board: board, isWonBy: .o))
    }
	
	func testWinCheckingHorizontal3() throws {
		let board = GameBoard()
		/*
		x - -
		- x -
		o o o
		*/
		
		try board.place(mark: .o, on: (0,2))
		try board.place(mark: .x, on: (0,0))
		try board.place(mark: .o, on: (1,2))
		try board.place(mark: .x, on: (1,1))
		try board.place(mark: .o, on: (2,2))
		
		XCTAssertTrue(game(board: board, isWonBy: .o))
		XCTAssertFalse(game(board: board, isWonBy: .x))
	}
    
    func testWinCheckingDiagonal1() throws {
        let board = GameBoard()
        /*
         x - -
         - x -
         o o x
         */
		
		try board.place(mark: .x, on: (0,0))
		try board.place(mark: .o, on: (0,2))
		try board.place(mark: .x, on: (1,1))
		try board.place(mark: .o, on: (1,2))
		try board.place(mark: .x, on: (2,2))
		
		XCTAssertTrue(game(board: board, isWonBy: .x))
		XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingDiagonal2() throws {
        let board = GameBoard()
        /*
         x - o
         - o -
         o x -
         */
		
		try board.place(mark: .o, on: (0,2))
		try board.place(mark: .x, on: (0,0))
		try board.place(mark: .o, on: (1,1))
		try board.place(mark: .x, on: (1,2))
		try board.place(mark: .o, on: (2,0))
		
		XCTAssertTrue(game(board: board, isWonBy: .o))
		XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testIncompleteGame() throws {
		let board = GameBoard()
		/*
		x o o
		- x -
		o x -
		*/
		
		try board.place(mark: .o, on: (0,2))
		try board.place(mark: .x, on: (0,0))
		try board.place(mark: .o, on: (1,0))
		try board.place(mark: .x, on: (1,1))
		try board.place(mark: .o, on: (2,0))
		
		XCTAssertFalse(board.isFull)
		XCTAssertFalse(game(board: board, isWonBy: .o))
		XCTAssertFalse(game(board: board, isWonBy: .x))
    }

    func testCatsGame() throws {
		let board = GameBoard()
		/*
		x o o
		o x x
		o x o
		*/
		
		try board.place(mark: .o, on: (0,2))
		try board.place(mark: .x, on: (0,0))
		try board.place(mark: .o, on: (1,0))
		try board.place(mark: .x, on: (1,1))
		try board.place(mark: .o, on: (2,0))
		try board.place(mark: .x, on: (1,2))
		try board.place(mark: .o, on: (0,1))
		try board.place(mark: .x, on: (2,1))
		try board.place(mark: .o, on: (2,2))

		XCTAssertTrue(board.isFull)
		XCTAssertFalse(game(board: board, isWonBy: .o))
		XCTAssertFalse(game(board: board, isWonBy: .x))
    }
}
