//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Shawn Gee on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testActivePlayer() throws {
        var game = Game()
        XCTAssertEqual(game.activePlayer, .x)
        
        try game.makeMark(at: (0, 0))
        XCTAssertEqual(game.activePlayer, .o)
        
        try game.makeMark(at: (1, 1))
        XCTAssertEqual(game.activePlayer, .x)
    }
    
    func testGameIsOver() throws {
        var game = Game()
        /*
         o x x
         o o -
         x o x
         */
        try game.makeMark(at: (2, 0))
        try game.makeMark(at: (0, 0))
        try game.makeMark(at: (1, 0))
        try game.makeMark(at: (0, 1))
        try game.makeMark(at: (0, 2))
        try game.makeMark(at: (1, 1))
        try game.makeMark(at: (2, 2))
        try game.makeMark(at: (1, 2))
        XCTAssertFalse(game.gameIsOver)
        
        /*
         o x x
         o o x
         x o x
         */
        try game.makeMark(at: (2, 1))
        XCTAssertTrue(game.gameIsOver)
    }
    
    func testWinningPlayer() throws {
        var game = try makeXWinsGame()
        XCTAssertEqual(game.winningPlayer, .x)
        
        game = try makeOWinsGame()
        XCTAssertEqual(game.winningPlayer, .o)
    }
    
    func testRestart() throws {
        var game = Game()
        XCTAssertNil(game.winningPlayer)
        /*
         x x x
         o o -
         - - -
         */
        try game.makeMark(at: (0, 0))
        try game.makeMark(at: (0, 1))
        try game.makeMark(at: (1, 0))
        try game.makeMark(at: (1, 1))
        try game.makeMark(at: (2, 0))
        
        game.restart()
        
        XCTAssertNil(game.board[(0,0)])
        XCTAssertNil(game.board[(0,1)])
        XCTAssertNil(game.board[(1,0)])
        XCTAssertNil(game.board[(1,1)])
        XCTAssertNil(game.board[(2,0)])
        
        XCTAssertEqual(game.activePlayer, .x)
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
    }
    
    func testMakeMark() throws {
        var game = Game()
        
        try game.makeMark(at: (0, 0))
        XCTAssertEqual(game.board[(0, 0)], .x)
        
        try game.makeMark(at: (0, 1))
        XCTAssertEqual(game.board[(0, 1)], .o)
    }
    
    func testCatGame() throws {
        let game = try makeCatGame()
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertNil(game.winningPlayer)
    }
    
    func testMakeMarkAfterGameOver() throws {
        var game = try makeCatGame()
        
        XCTAssertThrowsError(try game.makeMark(at: (0, 0))) { (error) in
            XCTAssertEqual(error as? GameError, .gameAlreadyOver)
        }
    }
    
    func testGameState() throws {
        var game = Game()
        XCTAssertEqual(game.state, Game.State.active(.x))
        
        try game.makeMark(at: (0, 0))
        XCTAssertEqual(game.state, Game.State.active(.o))
        
        game = try makeXWinsGame()
        XCTAssertEqual(game.state, Game.State.won(.x))
        
        game = try makeOWinsGame()
        XCTAssertEqual(game.state, Game.State.won(.o))
        
        game = try makeCatGame()
        XCTAssertEqual(game.state, Game.State.cat)
    }
    
    // MARK: - Helper Functions
    
    func makeXWinsGame() throws -> Game {
        var game = Game()
        XCTAssertNil(game.winningPlayer)
        /*
         x x x
         o o -
         - - -
         */
        try game.makeMark(at: (0, 0))
        try game.makeMark(at: (0, 1))
        try game.makeMark(at: (1, 0))
        try game.makeMark(at: (1, 1))
        try game.makeMark(at: (2, 0))
        
        return game
    }
    
    func makeOWinsGame() throws -> Game {
        var game = Game()
        /*
         x x o
         - o x
         o - -
         */
        try game.makeMark(at: (0, 0))
        try game.makeMark(at: (2, 0))
        try game.makeMark(at: (1, 0))
        try game.makeMark(at: (1, 1))
        try game.makeMark(at: (0, 1))
        try game.makeMark(at: (0, 2))
        
        return game
    }
    
    func makeCatGame() throws -> Game {
        var game = Game()
        /*
         x x o
         o o x
         x x o
         */
        try game.makeMark(at: (0, 0))
        try game.makeMark(at: (0, 1))
        try game.makeMark(at: (1, 0))
        try game.makeMark(at: (2, 0))
        try game.makeMark(at: (0, 2))
        try game.makeMark(at: (1, 1))
        try game.makeMark(at: (2, 1))
        try game.makeMark(at: (2, 2))
        try game.makeMark(at: (1, 2))
        
        return game
    }
    
    
}
