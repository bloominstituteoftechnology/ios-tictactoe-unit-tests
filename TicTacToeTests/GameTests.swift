//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Paul Yi on 3/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testXWins() throws {
        var game = Game()
        
        try game.makeMark(at: (0, 0))  // x
        try game.makeMark(at: (2, 0))  // o
        try game.makeMark(at: (2, 2))  // x
        try game.makeMark(at: (1, 2))  // o
        try game.makeMark(at: (1, 1))  // x
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertEqual(game.winningPlayer, .x)
    }
    
    func testOWins() throws {
        var game = Game()
        
        try game.makeMark(at: (1, 0))  // x
        try game.makeMark(at: (1, 1))  // o
        try game.makeMark(at: (0, 0))  // x
        try game.makeMark(at: (2, 0))  // o
        try game.makeMark(at: (1, 2))  // x
        try game.makeMark(at: (0, 2))  // o
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertEqual(game.winningPlayer, .o)
    }
    
    func testCatsGame() throws {
        var game = Game()
        
        try game.makeMark(at: (0, 0))  // x
        try game.makeMark(at: (2, 2))  // o
        try game.makeMark(at: (1, 1))  // x
        try game.makeMark(at: (0, 1))  // o
        try game.makeMark(at: (2, 1))  // x
        try game.makeMark(at: (1, 0))  // o
        try game.makeMark(at: (1, 2))  // x
        try game.makeMark(at: (2, 0))  // o
        try game.makeMark(at: (0, 2))  // x
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertNil(game.winningPlayer)
    }
    
    
    func testInProgressGame() {
        var game = Game()
        
        try! game.makeMark(at: (1, 0))  // x
        try! game.makeMark(at: (1, 1))  // o
        try! game.makeMark(at: (0, 0))  // x
        
        XCTAssertFalse(game.gameIsOver)
        XCTAssertEqual(game.activePlayer, .o)
        XCTAssertNil(game.winningPlayer)
    }
    
    func testRestart() throws {
        var game = Game()
        
        try game.makeMark(at: (0, 0))
        
        game.restart()
        
        XCTAssertFalse(game.gameIsOver)
        XCTAssertEqual(game.activePlayer, .x)
        XCTAssertNil(game.winningPlayer)
        
        try game.makeMark(at: (0, 0))  // x    
        try game.makeMark(at: (2, 0))  // o
        try game.makeMark(at: (2, 2))  // x
        try game.makeMark(at: (1, 2))  // o
        try game.makeMark(at: (1, 1))  // x
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertEqual(game.winningPlayer, .x)
        
        game.restart()
        
        XCTAssertFalse(game.gameIsOver)
        XCTAssertEqual(game.activePlayer, .x)
        XCTAssertNil(game.winningPlayer)
        
    }
    
}


