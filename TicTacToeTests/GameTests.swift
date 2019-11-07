//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Gi Pyo Kim on 11/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testActivePlayer() {
        var game = Game()
        
        try! game.makeMark(at: (0,0))
        XCTAssertEqual(game.activePlayer!, GameBoard.Mark.o)
        
        try! game.makeMark(at: (1,1))
        XCTAssertEqual(game.activePlayer!, GameBoard.Mark.x)
        
        try! game.makeMark(at: (2, 2))
        XCTAssertEqual(game.activePlayer!, GameBoard.Mark.o)
        
        game.restart()
        XCTAssertEqual(game.activePlayer!, GameBoard.Mark.x)
    }
    
    func testWinCase() {
        var game = Game()
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
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertEqual(game.winningPlayer, GameBoard.Mark.x)
    }
    
    func testCatGame() {
        var game = Game()
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (1, 2))
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
        
        try! game.makeMark(at: (2, 2))
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)

        
    }
}
