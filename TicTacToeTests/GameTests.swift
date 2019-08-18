//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Michael Stoffer on 8/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    func testRestart() {
        var game = Game()
        
        game.restart()
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertFalse(game.activePlayer == .o)
    }
    
    func testPlayerChange() {
        var game = Game()
        
        try! game.makeMark(at: (0, 0))
        
        XCTAssertTrue(game.activePlayer == .o)
        XCTAssertFalse(game.activePlayer == .x)
    }
    
    func testWin() {
        /*
         x o -
         x o -
         x - -
         */
        var game = Game()
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 2))
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertTrue(game.winningPlayer == .x)
        XCTAssertFalse(game.winningPlayer == .o)
    }
    
    func testCatsGame() {
        /*
         x o x
         o x o
         o x o
         */
        var game = Game()
        
        try! game.makeMark(at: (2, 2))
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (1, 2))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (2, 0))
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertNil(game.winningPlayer)
    }
}
