//
//  GamePlayTests.swift
//  TicTacToeTests
//
//  Created by Sameera Roussi on 6/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GamePlayTests: XCTestCase {

    func testGameCreation() {
        let game = Game()
        XCTAssertEqual(game.activePlayer, .x)
        XCTAssertFalse(game.isOver)
        XCTAssertNil(game.winningPlayer)
    }
    
    func testPlayerAlternation() {
        var game = Game()
        
        /*
         x o x
         x o o
         o x x
         */
        XCTAssertEqual(game.activePlayer, .x)
        try! game.makeMark(at: (0, 0)) // x
        XCTAssertEqual(game.activePlayer, .o)
        try! game.makeMark(at: (1, 0)) // o
        XCTAssertEqual(game.activePlayer, .x)
        try! game.makeMark(at: (2, 0)) // x
        XCTAssertEqual(game.activePlayer, .o)
        try! game.makeMark(at: (1, 1)) // o
        XCTAssertEqual(game.activePlayer, .x)
        try! game.makeMark(at: (0, 1)) // x
        XCTAssertEqual(game.activePlayer, .o)
        try! game.makeMark(at: (2, 1)) // o
        XCTAssertEqual(game.activePlayer, .x)
        try! game.makeMark(at: (1, 2)) // x
        XCTAssertEqual(game.activePlayer, .o)
        try! game.makeMark(at: (0, 2)) // o
        XCTAssertEqual(game.activePlayer, .x)
        try! game.makeMark(at: (2, 2)) // x
        XCTAssertTrue(game.isOver)
    }
    
    func testGameCompletionChecking() {
        var game = Game()
        
        /*
         x o x
         x o o
         o x x
         */
        try! game.makeMark(at: (0, 0)) // x
        XCTAssertFalse(game.isOver)
        try! game.makeMark(at: (1, 0)) // o
        XCTAssertFalse(game.isOver)
        try! game.makeMark(at: (2, 0)) // x
        XCTAssertFalse(game.isOver)
        try! game.makeMark(at: (1, 1)) // o
        XCTAssertFalse(game.isOver)
        try! game.makeMark(at: (0, 1)) // x
        XCTAssertFalse(game.isOver)
        try! game.makeMark(at: (2, 1)) // o
        XCTAssertFalse(game.isOver)
        try! game.makeMark(at: (1, 2)) // x
        XCTAssertFalse(game.isOver)
        try! game.makeMark(at: (0, 2)) // o
        XCTAssertFalse(game.isOver)
        try! game.makeMark(at: (2, 2)) // x
        XCTAssertTrue(game.isOver)
    }
    
    func testCatGame() {
        var game = Game()
        
        /*
         x o x
         x o o
         o x x
         */
        
        try! game.makeMark(at: (0, 0)) // x
        try! game.makeMark(at: (1, 0)) // o
        try! game.makeMark(at: (2, 0)) // x
        try! game.makeMark(at: (1, 1)) // o
        try! game.makeMark(at: (0, 1)) // x
        try! game.makeMark(at: (2, 1)) // o
        try! game.makeMark(at: (1, 2)) // x
        try! game.makeMark(at: (0, 2)) // o
        try! game.makeMark(at: (2, 2)) // x
        XCTAssertTrue(game.isOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertNil(game.winningPlayer)
    }
    
    func testEarlyWin() {
        var game = Game()
        /*
         x x x
         o o -
         - - -
         */
        try! game.makeMark(at: (0, 0)) // x
        try! game.makeMark(at: (0, 1)) // o
        try! game.makeMark(at: (1, 0)) // x
        try! game.makeMark(at: (1, 1)) // o
        try! game.makeMark(at: (2, 0)) // x
        XCTAssertTrue(game.isOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertNotNil(game.winningPlayer)
    }
    
    func testRestartingAfterIncomplete() {
        var game = Game()
        /*
         x x o
         o x x
         - - o
         */
        try! game.makeMark(at: (0, 0)) // x
        try! game.makeMark(at: (0, 1)) // o
        try! game.makeMark(at: (1, 0)) // x
        try! game.makeMark(at: (2, 0)) // o
        try! game.makeMark(at: (1, 1)) // x
        try! game.makeMark(at: (2, 2)) // o
        try! game.makeMark(at: (2, 1)) // x
        XCTAssertFalse(game.isOver)
        XCTAssertEqual(game.activePlayer, .o)
        XCTAssertNil(game.winningPlayer)
        
        game.restart()
        XCTAssertFalse(game.isOver)
        XCTAssertEqual(game.activePlayer, .x)
        XCTAssertNil(game.winningPlayer)
    }
    
    func testRestartingAfterWin() {
        var game = Game()
        /*
         x x o
         o x -
         - x o
         */
        try! game.makeMark(at: (0, 0)) // x
        try! game.makeMark(at: (0, 1)) // o
        try! game.makeMark(at: (1, 0)) // x
        try! game.makeMark(at: (2, 0)) // o
        try! game.makeMark(at: (1, 1)) // x
        try! game.makeMark(at: (2, 2)) // o
        try! game.makeMark(at: (1, 2)) // x
        XCTAssertTrue(game.isOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertEqual(game.winningPlayer, .x)
        
        game.restart()
        XCTAssertFalse(game.isOver)
        XCTAssertEqual(game.activePlayer, .x)
        XCTAssertNil(game.winningPlayer)
    }
    
}
