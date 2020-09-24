//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Kenneth Jones on 9/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testNewGame() throws {
        var game = Game()
        game.restart()
        
        XCTAssertTrue(game.gameIsOver == false)
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertTrue(game.gameState == .active(.x))
    }
    
    func testRestart() throws {
        var game = Game()
        game.restart()
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (2, 0))
        game.restart()
        
        XCTAssertTrue(game.gameIsOver == false)
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertTrue(game.gameState == .active(.x))
    }
    
    func testMakeMark() {
        var game = Game()
        game.restart()
        try! game.makeMark(at: (1, 1))
        
        for x in 0..<3 {
            for y in 0..<3 {
                if x == 1 && y == 1 { continue }
                XCTAssertNil(game.board[(x, y)])
            }
        }
        
        XCTAssertTrue(game.activePlayer == .o)
        XCTAssertTrue(game.gameState == .active(.o))
    }
    
    func testUndo() {
        var game = Game()
        game.restart()
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (1, 2))
        
        for x in 0..<3 {
            for y in 0..<3 {
                if x == 1 && y == 1 { continue }
                if x == 1 && y == 2 { continue }
                XCTAssertNil(game.board[(x, y)])
            }
        }
        
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertTrue(game.gameState == .active(.x))
        
        game.undo()
        
        for x in 0..<3 {
            for y in 0..<3 {
                if x == 1 && y == 1 { continue }
                XCTAssertNil(game.board[(x, y)])
            }
        }
        
        XCTAssertTrue(game.activePlayer == .o)
        XCTAssertTrue(game.gameState == .active(.o))
        
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (1, 2))
        try! game.makeMark(at: (2, 0))
        
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertTrue(game.gameState == .active(.x))
    }

}
