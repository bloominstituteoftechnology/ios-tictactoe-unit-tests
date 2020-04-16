//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Christy Hicks on 4/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    func testTogglePlayer() {
        var game = Game()
        
        XCTAssertEqual(game.activePlayer, .x)
        try! game.makeMark(at: (1, 1))
        XCTAssertEqual(game.activePlayer, .o)
        try! game.makeMark(at: (0, 0))
        XCTAssertEqual(game.activePlayer, .x)
        try! game.makeMark(at: (1, 2))
        XCTAssertFalse(game.activePlayer == .x)
    }
    
    func testMakeMarkError() {
        var game = Game()
        
        try! game.makeMark(at: (1, 1))
        XCTAssertThrowsError(try game.makeMark(at: (1, 1)))
    }
    
    func testGameIsNotOver() {
        var game = Game()
        
        XCTAssertFalse(game.gameIsOver)
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (1, 0))
        XCTAssertFalse(game.gameIsOver)
    }
    
    func testRestart() {
        /*
         x o x
         o o x
         o x x
         */
        var game = Game()
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0 ,2))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (1, 2))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (2, 2))
        
        game.restart()
        XCTAssertNil(game.winningPlayer)
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNoThrow(try game.makeMark(at: (0, 0)))
    }
}

