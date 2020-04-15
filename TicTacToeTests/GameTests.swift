//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Lydia Zhang on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testRestart() {
        var game = Game()
        game.restart()
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertTrue(game.gameIsOver == false)
    }
    
    func testPlayerSwitch() {
        var game = Game()
        
        try! game.makeMark(at: (2,2))
        XCTAssertTrue(game.activePlayer == .o)
        XCTAssertFalse(game.activePlayer == .x)
    }
    
    func testResult() {
        var game = Game()
        
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,2))
        
        XCTAssertTrue(game.gameIsOver == true)
        XCTAssertFalse(game.winningPlayer == .o)
        XCTAssertTrue(game.winningPlayer == .x)
        XCTAssertTrue(game.activePlayer == nil)
    }
    func testCatsResult() {
        var game = Game()
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (2, 2))
        try! game.makeMark(at: (1, 2))
        
        XCTAssertTrue(game.gameIsOver == true)
        XCTAssertFalse(game.winningPlayer == .x)
        XCTAssertFalse(game.winningPlayer == .o)
        XCTAssertTrue(game.activePlayer == nil)
    }
}
