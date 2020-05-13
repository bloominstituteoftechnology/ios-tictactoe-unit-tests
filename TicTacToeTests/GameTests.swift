//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Hunter Oppel on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testRestart() throws {
        let board = GameBoard()
        var game = Game(board: board)
        
        for x in 0...2 {
            for y in 0...2 {
                XCTAssertNil(game.board[(x, y)], "⚠️ Position (\(x), \(y)) was not empty.")
            }
        }
        
        try game.makeMark(at: (0, 0))
        try game.makeMark(at: (1, 1))
        try game.makeMark(at: (2, 2))
        
        game.restart()
        
        XCTAssertEqual(game.activePlayer, .x)
        
        for x in 0...2 {
            for y in 0...2 {
                XCTAssertNil(game.board[(x, y)], "⚠️ Position (\(x), \(y)) was not empty.")
            }
        }
    }
    
    func testMakeMark() throws {
        let board = GameBoard()
        var game = Game(board: board)
        
        try game.makeMark(at: (0, 0))
        XCTAssertEqual(game.board[(0, 0)], .x)
        
        XCTAssertEqual(game.activePlayer, .o)
        try game.makeMark(at: (2, 2))
        XCTAssertEqual(game.board[(2, 2)], .o)
    }
    
    func testGameIsOver() throws {
        let board = GameBoard()
        var game = Game(board: board)
        
        XCTAssertFalse(game.gameIsOver)
        
        try game.makeMark(at: (0, 0))
        try game.makeMark(at: (1, 1))
        try game.makeMark(at: (0, 1))
        try game.makeMark(at: (2, 2))
        try game.makeMark(at: (0, 2))
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertEqual(game.winningPlayer, .x)
    }
}
