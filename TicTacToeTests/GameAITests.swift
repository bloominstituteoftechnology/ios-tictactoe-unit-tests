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
        
        // if the game is not won by x, then fail
        XCTAssertTrue(game(board: board, isWonBy: .x))
        
        // if the game is not lost by o, then fail
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
        
        // if the game is not won by o, then fail
        XCTAssertTrue(game(board: board, isWonBy: .o))
        
        // if the game is not lost by x, then fail
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal1() {
        var board = GameBoard()
        
        /*
         - o -
         x x x
         o - -
         */
        
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (0, 2))
        
        // if the game is not won by x, then fail
        XCTAssertTrue(game(board: board, isWonBy: .x))
        
        // if the game is not lost by o, then fail
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal2() {
        var board = GameBoard()
        
        /*
         x - -
         - x -
         o o o
         */
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .o, on: (2, 2))
        
        // if the game is not won by o, then fail
        XCTAssertTrue(game(board: board, isWonBy: .o))
        
        // if the game is not lost by x, then fail
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingDiagonal1() {
        var board = GameBoard()
        
        /*
         x - -
         - x -
         o o x
         */
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .x, on: (2, 2))
        
        // if the game is not won by x, then fail
        XCTAssertTrue(game(board: board, isWonBy: .x))
        
        // if the game is not lost by o, then fail
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingDiagonal2() {
        var board = GameBoard()
        
        /*
         x - o
         - o -
         o x -
         */
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (1, 2))
        
        // if the game is not won by o, then fail
        XCTAssertTrue(game(board: board, isWonBy: .o))
        
        // if the game is not lost by x, then fail
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testIncompleteGame() {
        var board = GameBoard()
        
        // One scenario of an incomplete game
        
        /*
         x x o
         o o x
         x o -
         */
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (1, 2))

        // Assert that the board is not full and neither player has won
        XCTAssertFalse(board.isFull)
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        
    }

    func testCatsGame() {
        var board = GameBoard()
        
        // One scenario of a tie game
        
        /*
         x x o
         o o x
         x o x
         */
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .x, on: (2, 2))
        
        
        // In order for a tie to be true, assert that the board is full and also that it was not won by x and not won by y
        XCTAssertTrue(board.isFull, "Tie games only occur with a full board")
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
}
