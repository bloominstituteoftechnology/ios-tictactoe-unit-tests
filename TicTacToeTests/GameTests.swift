//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Moses Robinson on 2/27/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    var game: Game!
    
    override func setUp() {
        game = Game()
    }
    
    func testRestart() {
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (0, 2))
        
        game.restart()
        
        XCTAssertFalse(game.gameIsOver)
        XCTAssertEqual(game.activePlayer, .x)
        XCTAssertNil(game.winningPlayer)
        XCTAssertNil(game.board[(0, 0)])
        XCTAssertNil(game.board[(2, 0)])
        XCTAssertNil(game.board[(0, 2)])
    }
    
    func testWinWithMakeMark() {
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
        
        XCTAssertEqual(game.winningPlayer, .x)
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
    }
    
    func testCatsGameWithMakeMark() {
        /*
         o x o
         x o x
         x o x
         */
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (1, 2))
        try! game.makeMark(at: (2, 2))
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertNil(game.winningPlayer)
    }
}
