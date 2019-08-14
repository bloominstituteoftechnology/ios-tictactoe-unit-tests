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
    
    func testRestart() {
        var game = Game()
        game.restart()
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertFalse(game.activePlayer == .o)
    }
    
    func testPlacingSingleMark() {
        var board = GameBoard()
        do {
            try board.place(mark: .x, on: (0, 0))
        } catch {
            print(error)
        }
        
        XCTAssertEqual(.x, board[(0,0)])
    }
    
    func testPlayerChange() {
        var game = Game()

        try! game.makeMark(at: (0, 0))
        XCTAssertTrue(game.activePlayer == .o)
        XCTAssertFalse(game.activePlayer == .x)
    }
    
    func testWin() {
        var game = Game()
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 2))
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertTrue(game.winningPlayer == .x)
        XCTAssertFalse(game.winningPlayer == .o)
    }
    
    func testCatsGame() {
        var game = Game()
        
        try! game.makeMark(at: (2, 2))
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (1, 2))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (2, 0))
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
        XCTAssertNil(game.winningPlayer)
    }
}
