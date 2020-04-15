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
        
        // MARK: - Ask about this:
        // How much slower does the test become if I make these checks so often? I like the idea of checking every move to see if something triggers early than it's supposed to
        
        try! board.place(mark: .x, on: (1,1))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .o, on: (1,0))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (0,1))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .o, on: (0,2))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (2,1))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(board.isFull)
    }
    
    func testWinCheckingHorizontal2() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o o
         */
        try! board.place(mark: .o, on: (0, 2))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (1, 1))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (0, 0))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .o, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(board.isFull)
    }
    
    func testWinCheckingDiagonal1() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o x
         */
        try! board.place(mark: .x, on: (1, 1))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (0, 0))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .o, on: (0, 2))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(board.isFull)
    }
    
    func testWinCheckingDiagonal2() {
        var board = GameBoard()
        /*
         x - o
         - o -
         o x -
         */
        try! board.place(mark: .o, on: (1, 1))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (0, 0))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .o, on: (0, 2))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .o, on: (2, 0))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(board.isFull)
    }
    
    func testIncompleteGame() {
        var board = GameBoard()
        /*
        o o -
        x o o
        o x x
        */
        
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .o, on: (2, 1))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (2, 2))
        try! board.place(mark: .o, on: (1, 0))
        
        // Is the game not full?
        XCTAssertFalse(board.isFull)
        // Did x not win?
        XCTAssertFalse(game(board: board, isWonBy: .x))
        // Did o not win?
        XCTAssertFalse(game(board: board, isWonBy: .o))
        // Is it not a cat game?
        
    }

    func testCatsGame() {
        let board = GameBoard()
        /*
        o o x
        x o o
        o x x
        */
        
//        try! board.place(mark: .o, on: (1, 1))
//        try! board.place(mark: .o, on: (1, 1))
        
    }
}
