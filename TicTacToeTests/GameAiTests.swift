//
//  GameAiTests.swift
//  TicTacToeTests
//
//  Created by BrysonSaclausa on 9/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAiTests: XCTestCase {
    
    
    
    /*
     x o -
     x o -
     - o -
    */
    func testWinCheckingVertical() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .o, on: (1,0))
        try! board.place(mark: .x, on: (0,1))
        try! board.place(mark: .o, on: (1,1))
        try! board.place(mark: .o, on: (1,2))
        
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    /*
     x - -
     x o -
     x o -
    */
    
    func testWinCheckingVertical2() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .o, on: (1,1))
        try! board.place(mark: .x, on: (0,1))
        try! board.place(mark: .o, on: (1,2))
        try! board.place(mark: .x, on: (0,2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        
    }
    
    /*
     o - x
     - o x
     - o x
    */
    func testWinCheckingVertical3() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0,2))
        try! board.place(mark: .o, on: (0,0))
        try! board.place(mark: .x, on: (1,2))
        try! board.place(mark: .o, on: (2,1))
        try! board.place(mark: .x, on: (2,2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    
    
    
    // Horizontal

    /*
     x o x
     o o o
     - - -
    */
    
    func testWinCheckingHorizontal() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .o, on: (0,1))
        try! board.place(mark: .x, on: (0,2))
        try! board.place(mark: .o, on: (1,0))
        try! board.place(mark: .o, on: (1,1))
        try! board.place(mark: .o, on: (1,2))
        
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    /*
     x x x
     - o x
     - o o
    */
    
    func testWinCheckingHorizonta2() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .o, on: (1,1))
        try! board.place(mark: .x, on: (0,1))
        try! board.place(mark: .o, on: (2,1))
        try! board.place(mark: .x, on: (0,2))
        try! board.place(mark: .o, on: (2,2))
        try! board.place(mark: .o, on: (1,2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    /*
     o - x
     - x x
     o o o
    */
    
    func testWinCheckingHorizonta3() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0,2))
        try! board.place(mark: .o, on: (0,0))
        try! board.place(mark: .x, on: (1,1))
        try! board.place(mark: .x, on: (1,2))
        try! board.place(mark: .o, on: (2,0))
        try! board.place(mark: .o, on: (2,1))
        try! board.place(mark: .o, on: (2,2))
        
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }

    
    
    
    
    
    
    // Incomplete Game
    /*
     x o x
     o o o
     - - -
    */
    func textIncompleteGame() {
        var board = GameBoard()
        
        try! board.place(mark: .o, on: (2,0))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1,1))
        try! board.place(mark: .x, on: (1,2))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        
        
    }
    
    
    
    
    // Cats Game
    
    func testCatsGame() {
        var board = GameBoard()
        
        try! board.place(mark: .o, on: (1,0))
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .o, on: (1,1))
        try! board.place(mark: .x, on: (2,0))
        try! board.place(mark: .o, on: (2,1))
        try! board.place(mark: .x, on: (0,1))
        try! board.place(mark: .o, on: (0,2))
        try! board.place(mark: .x, on: (1,2))
        try! board.place(mark: .x, on: (2,2))
        
        XCTAssertTrue(board.isFull)
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
 

}
