//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Jesse Ruiz on 11/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testRestart() {
        var game = Game()
        game.restart()
        
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertFalse(game.activePlayer == .o)
        XCTAssertTrue(game.gameIsOver == false)
    }
    
    func testMove() {
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (0, 0))
        XCTAssertEqual(.x, board[(0, 0)])
    }
    
    func testPlayerXWins() {
        var game = Game()
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (2, 2))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 1))
        
        XCTAssertTrue(game.winningPlayer == .x)
    }
    
    func testPlayerOWins() {
        var game = Game()
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (2, 2))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 1))
        
        XCTAssertTrue(game.winningPlayer == .o)
    }
    
    func testCatsGame() {
        var game = Game()
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (2, 2))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 2))
        
        XCTAssertFalse(game.winningPlayer == .o)
        XCTAssertFalse(game.winningPlayer == .x)
    }
}
