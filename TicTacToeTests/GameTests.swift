//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Chad Rutherford on 1/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testInitialGameBoard() {
        let game = Game()
        
        // Checking that game board starts empty
        XCTAssertFalse(game.board.isFull)
        
        // Checking initial player is X
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.x)
        
        // Check game is not over
        XCTAssertFalse(game.gameIsOver)
        
        // Check winning player does not have a value
        XCTAssertNil(game.winningPlayer)
        
        // Checking initial game state is active
        XCTAssertEqual(game.gameState, Game.GameState.active(.x))
    }
    
    func testActivePlayerChanges() {
        var game = Game()
        
        try! game.makeMark(at: (2, 2))
        
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.o)
        XCTAssertNotEqual(game.activePlayer, GameBoard.Mark.x)
        
        try! game.makeMark(at: (0, 0))
        
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.x)
        XCTAssertNotEqual(game.activePlayer, GameBoard.Mark.o)
    }
    
    func testNoMarkAfterWin() {
        var game = Game()
        
        game.gameIsOver = true
        game.gameState = .won(.x)
        
        try! game.makeMark(at: (0, 0))
        
        XCTAssertNil(game.board[(0, 0)])
    }
    
    func testForInvalidMoves() {
        // given
        var game = Game()
        
        // when
        try! game.makeMark(at: (0, 0))
        
        // then
        XCTAssertThrowsError(try game.makeMark(at: (0, 0)))
        XCTAssertNoThrow(try game.makeMark(at: (2, 2)))
    }
    
    func testRestartResetsIntitalValues() {
        var game = Game()
        
        game.restart()
        
        // Checking that game board starts empty
        XCTAssertFalse(game.board.isFull)
        
        // Checking initial player is X
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.x)
        
        // Check game is not over
        XCTAssertFalse(game.gameIsOver)
        
        // Check winning player does not have a value
        XCTAssertNil(game.winningPlayer)
        
        // Checking initial game state is active
        XCTAssertEqual(game.gameState, Game.GameState.active(.x))
    }
    
    func testWinWithX() {
        var game = Game()
        
        /*
                    0   1   2
                    x   o   -   0
                    x   o   -   1
                    x   -   -   2
                    */
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 2))
        
        // Check game state is won
        XCTAssertEqual(game.gameState, Game.GameState.won(.x))
        // Check winning player is x
        XCTAssertEqual(game.winningPlayer, GameBoard.Mark.x)
        // Check game is over
        XCTAssertTrue(game.gameIsOver)
    }
    
    func testWinWithO() {
        var game = Game()
        
        /*
                    0   1   2
                    x   o   -   0
                    x   o   x   1
                    -   o   -   2
                    */
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (1, 2))
        
        // Check game state is won
        XCTAssertEqual(game.gameState, Game.GameState.won(.o))
        // Check winning player is x
        XCTAssertEqual(game.winningPlayer, GameBoard.Mark.o)
        // Check game is over
        XCTAssertTrue(game.gameIsOver)
    }
    
    func testCatsGame() {
        var game = Game()
        
        /*
                    0   1   2
                    _   _   _   0
                    _   _   _   1
                    _   x   o   2
                    */
        
        try! game.makeMark(at: (0, 0)) // x
        try! game.makeMark(at: (1, 0)) // o
        try! game.makeMark(at: (2, 0)) // x
        try! game.makeMark(at: (1, 1)) // o
        try! game.makeMark(at: (0, 1)) // x
        try! game.makeMark(at: (0, 2)) // o
        try! game.makeMark(at: (2, 1)) // x
        try! game.makeMark(at: (2, 2)) // o
        try! game.makeMark(at: (1, 2)) // x
        
        // Check game state is cat's game
        XCTAssertEqual(game.gameState, Game.GameState.cat)
        // Check No winner
        XCTAssertNil(game.winningPlayer)
        // Check game is over
        XCTAssertTrue(game.gameIsOver)
    }
}
