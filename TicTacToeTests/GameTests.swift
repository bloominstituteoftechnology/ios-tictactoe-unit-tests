//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Isaac Lyons on 11/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testRestart() {
        var game = Game()
        
        try! game.makeMark(at: (0, 0))
        game.restart()
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(game.board[(x, y)])
            }
        }
    }
    
    func testMakeMark() {
        var game = Game()
        
        XCTAssertNoThrow(try game.makeMark(at: (0, 0)))
        XCTAssertThrowsError(try game.makeMark(at: (0, 0)))
    }
    
    func testGameIsOver() {
        var game = Game()
        
        XCTAssertFalse(game.gameIsOver)
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 2))
        XCTAssertTrue(game.gameIsOver)
    }
    
    func testWinningPlayer() {
        var game = Game()
        
        XCTAssertNil(game.winningPlayer)
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 2))
        XCTAssertEqual(game.winningPlayer, .x)
    }

}
