//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Moin Uddin on 10/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testStartingWinningPlayerIsNil() {
        let game = Game()
        XCTAssertTrue(game.winningPlayer == nil)
    }
    
    func testStartPlayerIsX() {
        let game = Game()
        XCTAssertTrue(game.activePlayer == .x)
    }
    
    func testSwitchesPlayers() {
        var game = Game()
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertNoThrow(try game.makeMark(at: (0,0)))
        XCTAssertTrue(game.activePlayer == .o)
    }
    func testXWins() {
        var game = Game()
        XCTAssertNoThrow(try game.makeMark(at: (0,0)))
        XCTAssertNoThrow(try game.makeMark(at: (1,0)))
        XCTAssertNoThrow(try game.makeMark(at: (0,1)))
        XCTAssertNoThrow(try game.makeMark(at: (2,0)))
        XCTAssertNoThrow(try game.makeMark(at: (0,2)))
        XCTAssertTrue(game.winningPlayer == .x)
    }

}
