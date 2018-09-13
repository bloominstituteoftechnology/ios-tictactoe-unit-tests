//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Linh Bouniol on 9/12/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testXWins() {
        // make new game
        var game = Game()
        
        try! game.makeMark(at: (0, 0))  // x
        try! game.makeMark(at: (2, 0))  // o
        try! game.makeMark(at: (2, 2))  // x
        try! game.makeMark(at: (1, 2))  // o
        try! game.makeMark(at: (1, 1))  // x
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertEqual(game.winningPlayer, .x)
    }
    
    func testOWins() {
        var game = Game()
        
        try! game.makeMark(at: (1, 0))  // x
        try! game.makeMark(at: (1, 1))  // o
        try! game.makeMark(at: (0, 0))  // x
        try! game.makeMark(at: (2, 0))  // o
        try! game.makeMark(at: (1, 2))  // x
        try! game.makeMark(at: (0, 2))  // o
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertEqual(game.winningPlayer, .o)
    }
    
    func testCatsGame() {
        var game = Game()
        
        try! game.makeMark(at: (0, 0))  // x
        try! game.makeMark(at: (2, 2))  // o
        try! game.makeMark(at: (1, 1))  // x
        try! game.makeMark(at: (0, 1))  // o
        try! game.makeMark(at: (2, 1))  // x
        try! game.makeMark(at: (1, 0))  // o
        try! game.makeMark(at: (1, 2))  // x
        try! game.makeMark(at: (2, 0))  // o
        try! game.makeMark(at: (0, 2))  // x
        
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
    
    func testRestart() {
        var game = Game()   // the properties in Game only have those default values when we create a new game. Those values need to be set to something when they are set in restart()
        
        try! game.makeMark(at: (0, 0))  // x
        
        game.restart()
        
        XCTAssertFalse(game.gameIsOver)
        XCTAssertEqual(game.activePlayer, .x) // restarted, player is x again (default)
        XCTAssertNil(game.winningPlayer) // restarted, new game
        
        try! game.makeMark(at: (0, 0))  // x    // if we're able to place x on the same square, then restart() failed
        try! game.makeMark(at: (2, 0))  // o    // if there were no error, continue playing a full game
        try! game.makeMark(at: (2, 2))  // x
        try! game.makeMark(at: (1, 2))  // o
        try! game.makeMark(at: (1, 1))  // x
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertEqual(game.winningPlayer, .x)
        
        game.restart()  // if we commented out gameIsOver and winningPlayer in restart() from Game.swift, when we call restart(), those two properties didnt change, gameIsOVer is still true and winningPlayer is x (from above game)
        
        XCTAssertFalse(game.gameIsOver)
        XCTAssertEqual(game.activePlayer, .x)
        XCTAssertNil(game.winningPlayer)
        
    }
    
}
