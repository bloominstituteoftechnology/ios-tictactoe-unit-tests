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
    
    func testWinCheckingVertical0() {
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
    
    func testWinCheckingVertical1() {
        var board = GameBoard()
        /*
         o x -
         o x -
         - x -
         */
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical2() {
        var board = GameBoard()
        /*
         o - x
         o - x
         - - x
         */
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal0() {
        var board = GameBoard()
        /*
         - o -
         x x x
         o - -
         */
        
        
    }
    
    func testWinCheckingHorizontal1() {
        var board = GameBoard()
        /*
         o - -
         - o -
         x x x
         */
    }
    
    func testWinCheckingHorizontal2() {
        var board = GameBoard()
        /*
         o - -
         - 0 -
         x x x
         */
    }
    
    func testWinCheckingDiagonal1() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o x
         */
    }
    
    func testWinCheckingDiagonal2() {
        var board = GameBoard()
        /*
         o - x
         - x -
         x o -
         */
    }
    
    func testIncompleteGame() {
    }

    func testCatsGame() {
    }
}
