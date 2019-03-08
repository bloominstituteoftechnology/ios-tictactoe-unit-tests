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
    
    var board: GameBoard!
    
    override func setUp() {
        super.setUp()
        board = GameBoard()
    }
    
    func testWinCheckingVertical1() throws {
        /*
        x o -
        x o -
        x - -
        */
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (1, 0))
        try board.place(mark: .x, on: (0, 1))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .x, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical2() throws {
        /*
         x o -
         x o -
         - o -
         */
        try board.place(mark: .o, on: (1, 0))
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .x, on: (0, 1))
        try board.place(mark: .o, on: (1, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingVertical3() throws {
        /*
         x - o
         x - o
         - - o
         */
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .x, on: (0, 1))
        try board.place(mark: .o, on: (2, 0))
        try board.place(mark: .o, on: (2, 1))
        try board.place(mark: .o, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal1() throws {
        /*
         x x x
         o o -
         - - -
         */
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .x, on: (1, 0))
        try board.place(mark: .x, on: (2, 0))
        try board.place(mark: .o, on: (0, 1))
        try board.place(mark: .o, on: (1, 1))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        
        
    }
    
    func testWinCheckingHorizontal2() throws {
        /*
         x x -
         o o o
         - - -
         */
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .x, on: (1, 0))
        try board.place(mark: .o, on: (0, 1))
        try board.place(mark: .o, on: (1, 1))
        try board.place(mark: .o, on: (2, 1))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal3() throws {
        /*
         x x -
         - - -
         o o o
         */
        try board.place(mark: .x, on: (0, 0))
        try board.place(mark: .x, on: (1, 0))
        try board.place(mark: .o, on: (0, 2))
        try board.place(mark: .o, on: (1, 2))
        try board.place(mark: .o, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingDiagonal1() throws {
        /*
         x - -
         - x -
         o o x
         */
    }
    
    func testWinCheckingDiagonal2() throws {
        /*
         x - o
         - o -
         o x -
         */
    }
    
    func testIncompleteGame() throws {
    }

    func testCatsGame() throws {
    }
}
