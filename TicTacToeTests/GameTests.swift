//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by John Kouris on 11/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testVerticalXWin() {
        var game = Game()
        /*
         x o -
         x o -
         x - -
         */
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,2))
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNotEqual(game.winningPlayer, GameBoard.Mark.o)
    }
    
    func testHorizontalXWin() {
        var game = Game()
        /*
         x x x
         o o -
         - - -
         */
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,0))
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertEqual(game.winningPlayer, GameBoard.Mark.x)
    }
    
    func testDiagonalOWin() {
        var game = Game()
        /*
         o x x
         - o -
         x - o
         */
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (2,2))
        
        XCTAssertTrue(game.gameIsOver)
        XCTAssertEqual(game.winningPlayer, GameBoard.Mark.o)
    }
    
    func testPlacingDuplicate() {
        var game = Game()
        
        try! game.makeMark(at: (0,0))
        
        XCTAssertThrowsError(try game.makeMark(at: (0,0))) { error in
            XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
        }
    }

    func testCurrentPlayer() {
        var game = Game()
        
        XCTAssertEqual(game.activePlayer!, GameBoard.Mark.x)
        
        try! game.makeMark(at: (0,0))
        XCTAssertEqual(game.activePlayer!, GameBoard.Mark.o)
        
        try! game.makeMark(at: (1,1))
        XCTAssertEqual(game.activePlayer!, GameBoard.Mark.x)
        
        game.restart()
        XCTAssertEqual(game.activePlayer!, GameBoard.Mark.x)
    }
    
}
