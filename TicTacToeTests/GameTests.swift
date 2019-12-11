//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Lambda_School_Loaner_204 on 12/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

@testable import TicTacToe

class GameTests: XCTestCase {

    func testGameRestart() {
        var game = Game(board: GameBoard(), activePlayer: .o, gameIsOver: false, winningPlayer: nil)
        XCTAssertTrue(game.activePlayer == GameBoard.Mark.o)
        game.restart()
        XCTAssertFalse(game.board.isFull)
        XCTAssertTrue(game.activePlayer == GameBoard.Mark.x)
    }

    func testGameMakeMark() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .o, gameIsOver: false, winningPlayer: nil)
        
        /*
         o - -
         - - -
         - - -
         */
        
        XCTAssertNoThrow(try game.makeMark(at: (0, 0)))
        XCTAssertEqual(game.board[(0, 0)], .o)
    }
    
    func testGameTakingTurns() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .o, gameIsOver: false, winningPlayer: nil)
        
        /*
         o - o
         - x -
         x - -
         */
        
        XCTAssertNoThrow(try game.makeMark(at: (0, 0)))
        XCTAssertEqual(game.board[(0, 0)], .o)
        XCTAssertNoThrow(try game.makeMark(at: (1, 1)))
        XCTAssertEqual(game.board[(1, 1)], .x)
        XCTAssertNoThrow(try game.makeMark(at: (2, 0)))
        XCTAssertEqual(game.board[(2, 0)], .o)
        XCTAssertNoThrow(try game.makeMark(at: (0, 2)))
        XCTAssertEqual(game.board[(0, 2)], .x)
    }
    
    func testPlacingMarkOnOccupiedMark() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .o, gameIsOver: false, winningPlayer: nil)
        
        /*
         x/o - -
         - - -
         - - -
         */
        
        XCTAssertNoThrow(try game.makeMark(at: (0, 0)))
        // x tries to place mark on o
        XCTAssertThrowsError(try game.makeMark(at: (0, 0)))
        XCTAssertEqual(game.board[(0, 0)], .o)
    }
    
    func testCatsGame() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        
        /*
         x o x
         x o o
         o x x
         */
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (2, 2))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (1, 2))
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.winningPlayer, "Cats Game!")
    }
    
    func testXPlayerWins() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        
        /*
         x - -
         o x -
         - o x
         */
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (1, 2))
        try! game.makeMark(at: (2, 2))
        XCTAssertTrue(game.gameIsOver)
        XCTAssertTrue(game.winningPlayer == GameBoard.Mark.x)
        
        testGameRestart()
    }
}
