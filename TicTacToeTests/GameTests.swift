//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Ivan Caldwell on 2/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    var boardTest = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
    
    
    // MARK: Question
    override func setUp() {
        // Don't know exactly how this is use...
        // Could I get an example??
    }

    
    
    func testRestart() {

        // This test will check to see if every cell in our two
        // dimensional array is nil. If it is not the test should fail.
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(boardTest.board[(x, y)])
            }
        }
        
        // This test should prove that the active player is .x, because
        // our tic tac toe game always starts with .x
        XCTAssertTrue(boardTest.activePlayer == .x)
        
        // This test should assert at game restart that the gameIsOver
        // boolean is equal to false, otherwise it should fail.
        XCTAssertTrue(!boardTest.gameIsOver)
        
        // This test should assert that winning player is nil.
        XCTAssertFalse(boardTest.winningPlayer == boardTest.activePlayer)
        XCTAssertFalse(boardTest.winningPlayer != nil)
        
    }
    
    func testMakeMark() {
        // To pass test the first active player must be .x
        XCTAssertEqual(boardTest.activePlayer, .x)
        
        // To pass test gameIsOver must be equal to false
        XCTAssertFalse(boardTest.gameIsOver)
        
        // To pass test winning player must still be nil
        XCTAssertEqual(boardTest.winningPlayer, nil)
        
        // To pass test must be able to mark square
        XCTAssertNoThrow(try boardTest.makeMark(at: (0, 0)))
        
        // To pass test the second active player must be .x
        // because I am alternating between each players turn...
        XCTAssertEqual(boardTest.activePlayer, .o)
        
        // To pass test must throw error because this cell has
        // already been marked.
        XCTAssertThrowsError(try boardTest.makeMark(at: (0, 0)))
        
        // To pass test must be able to mark square
        XCTAssertNoThrow(try boardTest.makeMark(at: (1, 1)))
        
    }

}
