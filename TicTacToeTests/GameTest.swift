//
//  GameTest.swift
//  TicTacToeTests
//
//  Created by Lambda_School_Loaner_218 on 1/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTest: XCTestCase {
    
    func testInitalGameBoard() {
        let game = Game()
        
        //Checking to see that game board starts out empty
        XCTAssertFalse(game.board.isFull)
        
        // Checking inital player is X
        
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.x)
        
        //check that game isnt over at start
        XCTAssertFalse(game.gameIsOver)
        
        //check winning player dose not have a value
        XCTAssertNil(game.winningPlayer)
        
        //checking inital game state is active
        XCTAssertEqual(game.gameState, Game.GameState.active(.x))
    }
    
    func testActivePlayerChanges() {
        var game = Game()
        
        try! game.makeMark(at: (2,2))
        
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.o)
        XCTAssertNotEqual(game.activePlayer, GameBoard.Mark.x)
        
        try! game.makeMark(at: (0,0))
        
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.x)
        XCTAssertNotEqual(game.activePlayer, GameBoard.Mark.o)
    }
    
    func testNoMarkAfterWon() {
        var game = Game()
        
        game.gameIsOver = true
        game.gameState = .won(.x)
        
        try! game.makeMark(at: (0,0))
        
        XCTAssertNil(game.board[(0,0)])
    }
    
    func testFprInvalidMoves() {
        var game = Game()
        
        try! game.makeMark(at: (0,0))
        
        XCTAssertThrowsError(try game.makeMark(at: (0,0)))
        XCTAssertNoThrow(try game.makeMark(at: (2,2)))
    }
    
    func testRestartResetesInitalValues() {
        var game = Game()
        
        game.restart()
        
        //Checking to see that game board starts out empty
        XCTAssertFalse(game.board.isFull)
        
        // Checking inital player is X
        
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.x)
        
        //check that game isnt over at start
        XCTAssertFalse(game.gameIsOver)
        
        //check winning player dose not have a value
        XCTAssertNil(game.winningPlayer)
        
        //checking inital game state is active
        XCTAssertEqual(game.gameState, Game.GameState.active(.x))
        
    }
    
    func testWinWithX() {
        var game = Game()
        
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,2))
        
        //check game state is won
        XCTAssertEqual(game.gameState, Game.GameState.won(.x))
        
        // check winning player is x
        XCTAssertEqual(game.winningPlayer, GameBoard.Mark.x)
        
        // check game is over
        XCTAssertTrue(game.gameIsOver)
        
        
        
    }
    
    func testWinWithO() {
        
        var game = Game()
        
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,1))
        try! game.makeMark(at: (1,2))
        
        //check game state is won
        XCTAssertEqual(game.gameState, Game.GameState.won(.o))
        
        // check winning player is x
        XCTAssertEqual(game.winningPlayer, GameBoard.Mark.o)
        
        // check game is over
        XCTAssertTrue(game.gameIsOver)
        
        
    }
    
    func testCatsGame() {
        var game = Game()
        
        try! game.makeMark(at: (0,0)) //x
        try! game.makeMark(at: (1,0)) //o
        try! game.makeMark(at: (2,0)) //x
        try! game.makeMark(at: (1,1)) //o
        try! game.makeMark(at: (0,1)) //x
        try! game.makeMark(at: (0,2)) //o
        try! game.makeMark(at: (2,1)) //x
        try! game.makeMark(at: (2,2)) //o
        try! game.makeMark(at: (1,2)) //x
        
        // check game state is cats game
        XCTAssertEqual(game.gameState, Game.GameState.cat)
        
        //check no winner
        XCTAssertNil(game.winningPlayer)
        
        //check game is over
        XCTAssertTrue(game.gameIsOver)
    }
    
}
