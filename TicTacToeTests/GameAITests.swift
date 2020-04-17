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
    
    var board = GameBoard()
    
    func assertWin(winner: GameBoard.Mark, loser: GameBoard.Mark) {
        XCTAssertTrue(game(board: board, isWonBy: winner))
        XCTAssertFalse(game(board: board, isWonBy: loser))
    }
    
    func placeMark(mark: GameBoard.Mark, on location: Coordinate) {
        try! board.place(mark: mark, on: location)
    }
    
    
    func testWinCheckingVertical1() {
        /*
         x o -
         x o -
         x - -
         */
        placeMark(mark: .x, on: (0, 0))
        placeMark(mark: .o, on: (1, 0))
        placeMark(mark: .x, on: (0, 1))
        placeMark(mark: .o, on: (1, 1))
        placeMark(mark: .x, on: (0, 2))
        
        assertWin(winner: .x, loser: .o)
        
    }
    
    func testWinCheckingVertical2() {
        /*
         x o -
         x o -
         - o -
         */
        placeMark(mark: .o, on: (1, 0))
        placeMark(mark: .x, on: (0, 0))
        placeMark(mark: .o, on: (1, 1))
        placeMark(mark: .x, on: (0, 1))
        placeMark(mark: .o, on: (1, 2))
        assertWin(winner: .o, loser: .x)
    }
    
    func testWinCheckingHorizontal1() {
        /*
         - o -
         x x x
         o - -
         */
        placeMark(mark: .x, on: (1, 0))
        placeMark(mark: .o, on: (0, 1))
        placeMark(mark: .x, on: (1, 1))
        placeMark(mark: .o, on: (2, 0))
        placeMark(mark: .x, on: (1, 2))
        assertWin(winner: .x, loser: .o)
    }
    
    func testWinCheckingHorizontal2() {
        /*
         x - -
         - x -
         o o o
         */
        placeMark(mark: .o, on: (2, 0))
        placeMark(mark: .x, on: (0, 0))
        placeMark(mark: .o, on: (2, 1))
        placeMark(mark: .x, on: (1, 1))
        placeMark(mark: .o, on: (2, 2))
        assertWin(winner: .o, loser: .x)
    }
    
    func testWinCheckingDiagonal1() {
        /*
         x - -
         - x -
         o o x
         */
        placeMark(mark: .x, on: (0, 0))
        placeMark(mark: .o, on: (0, 2))
        placeMark(mark: .x, on: (1, 1))
        placeMark(mark: .o, on: (2, 1))
        placeMark(mark: .x, on: (2, 2))
        assertWin(winner: .x, loser: .o)
    }
    
    func testWinCheckingDiagonal2() {
        /*
         x - o
         - o -
         o x -
         */
        placeMark(mark: .o, on: (0, 2))
        placeMark(mark: .x, on: (0, 0))
        placeMark(mark: .o, on: (1, 1))
        placeMark(mark: .x, on: (2, 1))
        placeMark(mark: .o, on: (2, 0))
        assertWin(winner: .o, loser: .x)
    }
    
    func testIncompleteGame() {
        //        - x o
        //        o x o
        //        x - -
        placeMark(mark: .x, on: (0, 1))
        placeMark(mark: .o, on: (0, 2))
        placeMark(mark: .x, on: (1, 1))
        placeMark(mark: .o, on: (1, 0))
        placeMark(mark: .x, on: (2, 0))
        placeMark(mark: .o, on: (1, 2))
        
        XCTAssertFalse(board.isFull)
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        
    }
    
    func testCatsGame() {
        //        x x o
        //        o o x
        //        x o x
        placeMark(mark: .x, on: (0, 0))
        placeMark(mark: .o, on: (0, 2))
        placeMark(mark: .x, on: (0, 1))
        placeMark(mark: .o, on: (1, 0))
        placeMark(mark: .x, on: (1, 2))
        placeMark(mark: .o, on: (1, 1))
        placeMark(mark: .x, on: (2, 0))
        placeMark(mark: .o, on: (2, 1))
        placeMark(mark: .x, on: (2, 2))
        
        XCTAssertTrue(board.isFull)
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
}
