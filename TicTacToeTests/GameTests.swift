//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by De MicheliStefano on 12.09.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    var game: Game!
    override func setUp() {
        game = Game()
    }
    
    func testContinuingMark() {
        /*
         x o X
         x o -
         - - -
         */
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,1))
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
        XCTAssertTrue(game.activePlayer == .o)
        
    }
    
    func testWinningMark() {
        /*
         x x o
         x - o
         - - O
         */
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (2, 2))
        XCTAssertTrue(game.gameIsOver)
        XCTAssertTrue(game.winningPlayer == .o)
        XCTAssertNil(game.activePlayer)
        
    }
    
    func testCatsMark() {
        /*
         x o X
         o x x
         o x o
         */
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (1, 2))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (2, 2))
        try! game.makeMark(at: (2, 0))
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
        XCTAssertNil(game.activePlayer)
        
    }
    
    func testRestart() {
        game.restart()
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
        XCTAssertTrue(game.activePlayer == .x)
    }

}
