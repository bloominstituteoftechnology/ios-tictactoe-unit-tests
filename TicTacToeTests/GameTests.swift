//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Benjamin Hakes on 1/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testGameIsOver() {
        
        var newGame = Game()
        /*
         x o x
         x o x
         o x o
         */
        try! newGame.makeMark(at: (2, 1)) // x
        try! newGame.makeMark(at: (1, 1)) // o
        try! newGame.makeMark(at: (2, 0)) // x
        try! newGame.makeMark(at: (2, 2)) // o
        try! newGame.makeMark(at: (0, 0)) // x
        try! newGame.makeMark(at: (1, 0)) // o
        try! newGame.makeMark(at: (1, 2)) // x
        try! newGame.makeMark(at: (0, 2)) // o
        try! newGame.makeMark(at: (0, 1)) // x
        
        guard let gameIsOver = newGame.gameIsOver else {
            XCTAssertTrue(false)
            return
        }
        XCTAssertTrue(gameIsOver)
        
    }
    
    func testNSLogErrorOnDuplicateMark() {
        
        var newGame = Game()
        /*
         - - -
         - - x
         - - -
         */
        try! newGame.makeMark(at: (2, 1)) // x
        XCTAssertThrowsError(try newGame.makeMark(at: (2, 1))) // o
    }
    
    func testActivePlayer() {
        
        var newGame = Game()
        /*
         - - -
         - - -
         - - -
         */
        
        XCTAssertTrue(newGame.activePlayer == GameBoard.Mark.x)
        
        /*
         x - -
         - - -
         - - -
         */
        try! newGame.makeMark(at: (0, 0)) // x
        
        XCTAssertTrue(newGame.activePlayer == GameBoard.Mark.o)
        
    }
    
    func testActivePlayer2() {
        
        var newGame = Game()
        /*
         x - -
         - - -
         - - -
         */
        try! newGame.makeMark(at: (0, 0)) // x
        try! newGame.makeMark(at: (0, 1)) // o
        
        guard let activePlayer = newGame.activePlayer else {
            XCTAssertTrue(false)
            return
        }
        XCTAssertTrue(activePlayer == GameBoard.Mark.x)
        XCTAssertFalse(activePlayer == GameBoard.Mark.o)
        
    }
    
    func testWinningPlayer() {
        
        var newGame = Game()
        /*
         x o x
         x o x
         - o o
         */
        try! newGame.makeMark(at: (2, 1)) // x
        try! newGame.makeMark(at: (1, 1)) // o
        try! newGame.makeMark(at: (2, 0)) // x
        try! newGame.makeMark(at: (2, 2)) // o
        try! newGame.makeMark(at: (0, 0)) // x
        try! newGame.makeMark(at: (1, 0)) // o
        try! newGame.makeMark(at: (0, 1)) // x
        try! newGame.makeMark(at: (1, 2)) // o
        
        guard let winningPlayer = newGame.winningPlayer else {
            XCTAssertTrue(false)
            return
        }
        XCTAssertTrue(winningPlayer == GameBoard.Mark.o)
        
    }
    
    func gameHasRestarted() {
        
        var newGame = Game()
        /*
         x o x
         x o x
         - o o
         */
        try! newGame.makeMark(at: (2, 1)) // x
        try! newGame.makeMark(at: (1, 1)) // o
        try! newGame.makeMark(at: (2, 0)) // x
        try! newGame.makeMark(at: (2, 2)) // o
        try! newGame.makeMark(at: (0, 0)) // x
        try! newGame.makeMark(at: (1, 0)) // o
        try! newGame.makeMark(at: (0, 1)) // x
        try! newGame.makeMark(at: (1, 2)) // o
        
        newGame.restart()
        /*
         - - -
         - - -
         - - -
         */
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(newGame.board[(x, y)])
            }
        }
        
        XCTAssert(newGame.activePlayer == GameBoard.Mark.x)
        XCTAssertNil(newGame.winningPlayer)
        XCTAssert(newGame.gameIsOver != true)
        
    }
    
    func boardIsEmpty() {
        
        let newGame = Game()
        /*
         - - -
         - - -
         - - -
         */
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(newGame.board[(x, y)])
            }
        }
        
    }

}
