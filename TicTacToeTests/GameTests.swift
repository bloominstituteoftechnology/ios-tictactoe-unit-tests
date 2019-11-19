//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Bobby Keffury on 11/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testResetGame() {
        
    }
    
    func testMakingMarks() {
        var board = GameBoard()
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 0)))
        XCTAssertEqual(board[(0, 0)], .o)
        XCTAssertNoThrow(try board.place(mark: .x, on: (2, 2)))
        XCTAssertEqual(board[(2, 2)], .x)
        for x in 0..<3 {
            for y in 0..<3 {
                if x == 0 && y == 0 { continue }
                if x == 2 && y == 2 { continue }
                XCTAssertNil(board[(x, y)])
            }
        }
        
        // Make sure you can't change an already marked square
        XCTAssertThrowsError(try board.place(mark: .x, on: (0, 0))) { (error) in
            XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
        }

    }
    
    func testActivePlayer() {
        
    }
    
    func testGameIsOver() {
        
    }
    
    func testWinningPlayer() {
        
    }
}
