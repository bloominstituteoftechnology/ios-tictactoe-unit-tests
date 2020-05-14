//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Bhawnish Kumar on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    
    func testActivePlayers() throws  {
        var game = Game()
        XCTAssertEqual(game.activePlayer, .x)
        
        try game.makeMark(at: (0, 0))
        XCTAssertEqual(game.activePlayer, .o)
        
        try game.makeMark(at: (1, 0))
        XCTAssertEqual(game.activePlayer, .x)
        
    }
    
    func testRestartGame() throws {
        var game = Game()
        XCTAssertNil(game.winningPlayer)
        
        try game.makeMark(at: (0, 1))
        try game.makeMark(at: (1, 2))
        try game.makeMark(at: (1, 0))
        try game.makeMark(at: (2, 1))
        try game.makeMark(at: (0, 2))
        
        game.restart()
        
        XCTAssertNil(game.board[(0, 1)])
        XCTAssertNil(game.board[(0, 1)])
        XCTAssertNil(game.board[(0, 1)])
        XCTAssertNil(game.board[(0, 1)])
        XCTAssertNil(game.board[(0, 1)])
        
        XCTAssertEqual(game.activePlayer, .x)
        XCTAssertNil(game.winningPlayer)
        XCTAssertFalse(game.gameIsOver)
        
    }
    
    func testPlayerXWins() throws {
        var game = Game()
        
        XCTAssertNil(game.winningPlayer)
        
        try game.makeMark(at: (0, 0))
        try game.makeMark(at: (0, 1))
        try game.makeMark(at: (1, 0))
        try game.makeMark(at: (0, 2))
        try game.makeMark(at: (2, 0))
        
        XCTAssertEqual(game.winningPlayer, .x)
        XCTAssertNotEqual(game.winningPlayer, .o)
    }
    
    func testPlayerOWins() throws {
        var game = Game()
        
        XCTAssertNil(game.winningPlayer)
        
        try game.makeMark(at: (2, 1))
        try game.makeMark(at: (0, 0))
        try game.makeMark(at: (1, 0))
        try game.makeMark(at: (1, 1))
        try game.makeMark(at: (2, 0))
        try game.makeMark(at: (2, 2))
        
        XCTAssertEqual(game.winningPlayer, .o)
        XCTAssertNotEqual(game.winningPlayer, .x)
    }
    
    
    func testGameCatGame() throws {
        var game = Game()
        
        try game.makeMark(at: (0, 0))
        try game.makeMark(at: (0, 1))
        try game.makeMark(at: (1, 1))
        try game.makeMark(at: (0, 2))
        try game.makeMark(at: (1, 2))
        try game.makeMark(at: (1, 0))
        try game.makeMark(at: (2, 0))
        try game.makeMark(at: (2, 2))
        try game.makeMark(at: (2, 1))
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertNil(game.winningPlayer)
    }
    
    func testGameOver() throws {
        var game = Game()
        
        try game.makeMark(at: (2, 0))
        try game.makeMark(at: (0, 0))
        try game.makeMark(at: (1, 0))
        try game.makeMark(at: (0, 1))
        try game.makeMark(at: (0, 2))
        try game.makeMark(at: (1, 1))
        try game.makeMark(at: (2, 2))
        try game.makeMark(at: (1, 2))
        XCTAssertFalse(game.gameIsOver)
        try game.makeMark(at: (2, 1))
        XCTAssertTrue(game.gameIsOver)
        
    }
    
    func testInvalidMovie() throws {
        var game = Game()
        
        try game.makeMark(at: (1, 0))
        
        do {
            try game.makeMark(at: (1, 0))
        } catch {
            XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
        }
        
        try game.makeMark(at: (2, 2))
        
        do {
                  try game.makeMark(at: (2, 2))
              } catch {
                  XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
              }
        
        try game.makeMark(at: (0, 2))
               
               do {
                         try game.makeMark(at: (0, 2))
                     } catch {
                         XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
                     }
    }
}
