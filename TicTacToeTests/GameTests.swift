//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Dillon McElhinney on 10/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    var game = Game()
    
    override func setUp() {
        game = Game()
        game.restart()
    }
    
    // Test restarting a game
    func testRestart() {
        
        // Check that the board is empty
        XCTAssertFalse(game.board.isFull)
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(game.board[(x, y)])
            }
        }
        // Check that X is the active player
        XCTAssertEqual(game.activePlayer, .x)
        XCTAssertFalse(game.gameIsOver)
        
        // Make some moves, restart and recheck
        try! game.makeMark(at: (2,1))
        try! game.makeMark(at: (1,1))
        game.restart()
        
        // Check that the board is empty
        XCTAssertFalse(game.board.isFull)
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(game.board[(x, y)])
            }
        }
        // Check that X is the active player
        XCTAssertEqual(game.activePlayer, .x)
        XCTAssertFalse(game.gameIsOver)
    }

    // Test making a mark
    func testMakingMark() {
        // Have the first player make a mark
        XCTAssertNoThrow(try game.makeMark(at: (1,1)))
        // Check that the mark is on the board
        XCTAssertEqual(game.board[(1,1)], .x)
        // Check that the active player has switched
        XCTAssertEqual(game.activePlayer, .o)
        // Check that the game is still going
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
    }
    
    // Test X winning a game
    func testWinningGameX() {
        // Play out the game
        /*
         x o x
         o x -
         o - x
         */
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (2,2))
        
        // Check that X won the game
        XCTAssert(game.gameIsOver)
        XCTAssertEqual(game.winningPlayer, .x)
        XCTAssertFalse(game.board.isFull)
        
        // Check that restarting the game works
        game.restart()
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
    }
    
    // Test O winning a game
    func testWinningGameO() {
        // Play out the game
        /*
         x - x
         x o x
         o o o
         */
        try! game.makeMark(at: (2,1))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (2,2))
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (1,2))
        
        // Check that O won the game
        XCTAssert(game.gameIsOver)
        XCTAssertEqual(game.winningPlayer, .o)
        XCTAssertFalse(game.board.isFull)
        
        // Check that restarting the game works
        game.restart()
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
    }
    
    // Test Cat's game
    func testCatsGame() {
        // Play out the game
        /*
         x o x
         x x o
         o x o
         */
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,2))
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (1,2))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (2,1))
        try! game.makeMark(at: (0,0))
        
        // Check that no one won the game
        XCTAssert(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
        XCTAssert(game.board.isFull)
        
        // Check that restarting the game works
        game.restart()
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
    }
}
