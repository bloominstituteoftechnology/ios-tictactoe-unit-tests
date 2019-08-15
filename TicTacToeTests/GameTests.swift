//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Kat Milton on 8/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    var game = Game()
    
    override func setUp() {
        super.setUp()
        game = Game()
    }
    
    func testRestart() {
        game.restart()
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertFalse(game.activePlayer == .o)
    }
    
    func testPlacingSingleMark() throws {
        var board = GameBoard()
        
        try board.place(mark: .x, on: (0, 0))
        XCTAssertEqual(.x, board[(0,0)])
    }
    
    func testPlayerChange() throws {
        try game.makeMark(at: (0, 0))
        XCTAssertTrue(game.activePlayer == .o)
        XCTAssertFalse(game.activePlayer == .x)
    }
    
    func testPlayerXWins() throws {
        try game.makeMark(at: (0, 0))
        try game.makeMark(at: (1, 0))
        try game.makeMark(at: (0, 1))
        try game.makeMark(at: (1, 1))
        try game.makeMark(at: (0, 2))
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertTrue(game.winningPlayer == .x)
        XCTAssertFalse(game.winningPlayer == .o)
    }
    
    func testCatsGame() throws {
        try game.makeMark(at: (2, 2))
        try game.makeMark(at: (0, 0))
        try game.makeMark(at: (0, 1))
        try game.makeMark(at: (0, 2))
        try game.makeMark(at: (1, 0))
        try game.makeMark(at: (1, 1))
        try game.makeMark(at: (1, 2))
        try game.makeMark(at: (2, 1))
        try game.makeMark(at: (2, 0))
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertNil(game.winningPlayer)
    }
}
