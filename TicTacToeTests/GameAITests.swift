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
        board = GameBoard()
    }
    
    func testWinCheckingVertical0() {
        /*
         x o -
         x o -
         x - -
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .o, on: (1, 1))
        
        XCTAssertTrue(checkGame(board: board, isWonBy: .x))
        XCTAssertFalse(checkGame(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical1() {
        /*
         x o -
         x o -
         - o -
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (1, 2))
        
        XCTAssertTrue(checkGame(board: board, isWonBy: .o))
        XCTAssertFalse(checkGame(board: board, isWonBy: .x))
    }
    
    func testWinCheckingVertical2() {
        /*
         x - o
         x - o
         - - o
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .o, on: (2, 1))
        try! board.place(mark: .o, on: (2, 2))
        XCTAssertTrue(checkGame(board: board, isWonBy: .o))
        XCTAssertFalse(checkGame(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal0() {
        /*
         x x x
         o o -
         - - -
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        XCTAssertTrue(checkGame(board: board, isWonBy: .x))
        XCTAssertFalse(checkGame(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal1() {
        /*
         x x -
         o o o
         - - -
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (2, 1))
        XCTAssertTrue(checkGame(board: board, isWonBy: .o))
        XCTAssertFalse(checkGame(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorzontal2() {
        /*
         x x -
         - - -
         o o o
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .o, on: (2, 2))
        XCTAssertTrue(checkGame(board: board, isWonBy: .o))
        XCTAssertFalse(checkGame(board: board, isWonBy: .x))
    }
    
    func testWinCheckingDiagonal1() {
        /*
         x - -
         - x -
         o o x
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .x, on: (2, 2))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertTrue(checkGame(board: board, isWonBy: .x))
        XCTAssertFalse(checkGame(board: board, isWonBy: .o))
    }
    
    func testWinCheckingDiagonal2() {
        /*
         x - o
         - o -
         o x -
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (0, 2))
        XCTAssertTrue(checkGame(board: board, isWonBy: .o))
        XCTAssertFalse(checkGame(board: board, isWonBy: .x))
    }
    
    func testIncompleteGame() {
        /*
         - - -
         - - -
         - - -
         */
        XCTAssertFalse(board.isFull)
        XCTAssertFalse(checkGame(board: board, isWonBy: .x))
        XCTAssertFalse(checkGame(board: board, isWonBy: .o))
    }

    func testCatsGame() {
        /*
         x o x
         x o x
         o x o
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (2, 2))
        XCTAssertFalse(checkGame(board: board, isWonBy: .x))
        XCTAssertFalse(checkGame(board: board, isWonBy: .o))
        XCTAssertTrue(board.isFull)
    }
}
