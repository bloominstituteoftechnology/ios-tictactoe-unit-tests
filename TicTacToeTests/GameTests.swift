//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Lisa Sampson on 9/12/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    var game: Game!
    override func setUp() {
        game = Game()
    }
    
    
    func testPlayerSwitching() {
        try! game.makeMark(at: (0, 0))
        XCTAssertTrue(game.activePlayer == .o)
    }
    
    func testRestart() {
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (0, 2))
        
        game.restart()
        
        XCTAssertFalse(game.gameIsOver)
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertTrue(game.winningPlayer == nil)
        XCTAssertTrue(game.board[(0, 0)] == nil)
        XCTAssertTrue(game.board[(1, 0)] == nil)
        XCTAssertTrue(game.board[(0, 1)] == nil)
        XCTAssertTrue(game.board[(2, 0)] == nil)
        XCTAssertTrue(game.board[(0, 2)] == nil)
    }
    
    func testMakeMarkWin() {
        /*
         x o -
         x o -
         x - -
         */
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 2))
        
        XCTAssertTrue(game.winningPlayer  == .x)
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
        
    }
    
    func testMakeMarkCatsGame() {
        /*
         x o o
         o x x
         x x o
         */
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 2))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (2, 2))
        try! game.makeMark(at: (1, 1))
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertNil(game.winningPlayer)
        
    }
}
