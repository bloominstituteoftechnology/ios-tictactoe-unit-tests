//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by morse on 12/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    /*
     Need to test:
     x Active player is x when game begins
     x MakeMark changes active player when a mark is made.
     x Makemark doesn't change active player if mark can't be made
     x Makemark actually makes a mark
     x Makemark then checks to see if the game is won
     x If game is won, winningPlayer is set correctly
     x Makemark does not change marks that have already been made
     x test for cat's game
     */
    
    func testNewGameActivePlayer() {
        var game = Game()
        game.activePlayer = .o
        game = Game()
        
        XCTAssertFalse(game.activePlayer == .some(.o))
        XCTAssertTrue(game.activePlayer == .some(.x))
    }
    
    func testChangeActivePlayer() {
        var game = Game()
        try! game.makeMark(at: (0,0))
        
        
        XCTAssertTrue(game.activePlayer == .some(.o))
        
        try! game.makeMark(at: (0,1))
        XCTAssertFalse(game.activePlayer == .some(.o))
        XCTAssertTrue(game.activePlayer == .some(.x))
    }
    
    func testChangePlayerFailsOnIllegalMove() {
        var game = Game()
        try! game.makeMark(at: (0,0))
        
        // Make sure you can't change an already marked square
        XCTAssertThrowsError(try game.makeMark(at: (0,0))) { (error) in
            XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
            }
        
        XCTAssertFalse(game.activePlayer == .some(.x))
        XCTAssertTrue(game.activePlayer == .some(.o))
    }
    
    func testDoesNotMarkMarkedSquare() {
        var game = Game()
        try! game.makeMark(at: (0,0))
        
        // Make sure you can't change an already marked square
        XCTAssertThrowsError(try game.makeMark(at: (0,0))) { (error) in
            XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
            }
        
        XCTAssertNotEqual(game.board[(0,0)], .o)
        XCTAssertEqual(game.board[(0,0)], .x)
    }
 
    func testMakingMarks() {
        var game = Game()
        
        /*
         x o x
         o x o
         o x x
         */
        
        try! game.makeMark(at: (0,0))
        XCTAssertEqual(game.board[(0, 0)], .x)
        try! game.makeMark(at: (0,1))
        XCTAssertEqual(game.board[(0, 1)], .o)
        try! game.makeMark(at: (0,2))
        XCTAssertEqual(game.board[(0, 2)], .x)
        try! game.makeMark(at: (1,0))
        XCTAssertEqual(game.board[(1, 0)], .o)
        try! game.makeMark(at: (1,1))
        XCTAssertEqual(game.board[(1, 1)], .x)
        try! game.makeMark(at: (1,2))
        XCTAssertEqual(game.board[(1, 2)], .o)
        try! game.makeMark(at: (2,1))
        XCTAssertEqual(game.board[(2, 1)], .x)
        try! game.makeMark(at: (2,0))
        XCTAssertEqual(game.board[(2, 0)], .o)
        try! game.makeMark(at: (2,2))
        XCTAssertEqual(game.board[(2, 2)], .x)
    }
    
    func testChecksForWin() {
        var game = Game()
        /*
         x o -
         x o -
         x - -
         */
        
        try!game.makeMark(at: (0,0))
        try!game.makeMark(at: (0,1))
        try!game.makeMark(at: (1,0))
        try!game.makeMark(at: (1,1))
        try!game.makeMark(at: (2,0))
        
        XCTAssertEqual(game.winningPlayer, GameBoard.Mark.x)
        XCTAssertNotEqual(game.winningPlayer, GameBoard.Mark.o)
        XCTAssertNotEqual(game.gameState, Game.GameState.won(.o))
        XCTAssertNotEqual(game.gameState, Game.GameState.cat)
        XCTAssertNotEqual(game.gameState, Game.GameState.active(.o))
        XCTAssertNotEqual(game.gameState, Game.GameState.active(.x))
        XCTAssertEqual(game.gameState, Game.GameState.won(.x))
    }
    
    func testCatsGame() {
        var game = Game()
        /*
        x o x
        o o x
        x x o
        */
        
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (1,2))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (2,2))
        try! game.makeMark(at: (2,1))
        
        XCTAssertEqual(game.gameIsOver, true)
        XCTAssertNotEqual(game.winningPlayer, .x)
        XCTAssertNotEqual(game.winningPlayer, .o)
        XCTAssertEqual(game.winningPlayer, nil)
        XCTAssertTrue(game.board.isFull)
    }

}
