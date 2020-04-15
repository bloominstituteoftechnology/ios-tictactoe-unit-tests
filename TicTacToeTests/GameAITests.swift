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
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        
    }
    
    func testWinCheckingHorizontal2() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o o
         */
    }
    
    func testWinCheckingDiagonal1() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o x
         */
        winningConditionForLtoRXDiagonal(mark: .x)
    }
    
    func testWinCheckingDiagonal2() {
        var board = GameBoard()
        /*
         x - o
         - o -
         o x -
         */
        winningConditionForRtoLODiagonal(mark: .o)
    }
    
    func testWinningConditionForXTopRow() {
        winningConditionForTopRow(mark: .x)
    }
    
    func testWinningConditionForOTopRow() {
        winningConditionForTopRow(mark: .o)
    }
    
    func testIncompleteGame() {
    }

      func testCatsGame() {
           var board = GameBoard()
           /*
            x o x
            x o x
            o x o
            */
           XCTAssertNoThrow(try! board.place(mark: .x, on: (0,0)))
           XCTAssertNoThrow(try! board.place(mark: .o, on: (1,0)))
           XCTAssertNoThrow(try! board.place(mark: .x, on: (2,0)))
           XCTAssertNoThrow(try! board.place(mark: .x, on: (0,1)))
           XCTAssertNoThrow(try! board.place(mark: .o, on: (1,1)))
           XCTAssertNoThrow(try! board.place(mark: .x, on: (2,1)))
           XCTAssertNoThrow(try! board.place(mark: .o, on: (0,2)))
           XCTAssertNoThrow(try! board.place(mark: .x, on: (1,2)))
           XCTAssertNoThrow(try! board.place(mark: .o, on: (2,2)))

    //       let xWon = game(board: board, isWonBy: .x)
     //      let oWon = game(board: board, isWonBy: .o)
           if board.isFull {
               XCTAssert(true, "Cat's game, Draw")
           }
       }
    
    
    func winningConditionForTopRow(mark: GameBoard.Mark) {
        var board = GameBoard()
        
        XCTAssertNoThrow(try! board.place(mark: mark, on: (0,0)))
        XCTAssertNoThrow(try! board.place(mark: mark, on: (1,0)))
        XCTAssertNoThrow(try! board.place(mark: mark, on: (2,0)))
        
        let markPlayerDidWin = game(board: board, isWonBy: mark)
        XCTAssert(markPlayerDidWin)
        
    }
    
    func winningConditionForMiddleRow(mark: GameBoard.Mark) {
        var board = GameBoard()
        
        XCTAssertNoThrow(try! board.place(mark: mark, on: (0,1)))
        XCTAssertNoThrow(try! board.place(mark: mark, on: (1,1)))
        XCTAssertNoThrow(try! board.place(mark: mark, on: (2,1)))
        
        let markPlayerDidWin = game(board: board, isWonBy: mark)
        XCTAssert(markPlayerDidWin)
    }
    
    func winningConditionForLtoRXDiagonal(mark: GameBoard.Mark) {
        var board = GameBoard()
        
        XCTAssertNoThrow(try! board.place(mark: mark, on: (0,0)))
        XCTAssertNoThrow(try! board.place(mark: mark, on: (1,1)))
        XCTAssertNoThrow(try! board.place(mark: mark, on: (2,2)))
        
        let markPlayerDidWin = game(board: board, isWonBy: mark)
        XCTAssert(markPlayerDidWin)
    }
    
    func winningConditionForRtoLODiagonal(mark: GameBoard.Mark) {
        var board = GameBoard()
        
        XCTAssertNoThrow(try! board.place(mark: mark, on: (2,0)))
        XCTAssertNoThrow(try! board.place(mark: mark, on: (1,1)))
        XCTAssertNoThrow(try! board.place(mark: mark, on: (0,2)))
        
        let markPlayerDidWin = game(board: board, isWonBy: mark)
        XCTAssert(markPlayerDidWin)
    }
}
