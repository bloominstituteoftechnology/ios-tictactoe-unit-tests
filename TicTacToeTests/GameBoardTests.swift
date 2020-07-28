//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Rob Vance on 7/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {
    // Goal- Make sure the board is empty right after it's initialized
    
    func testCreatingEmptyBoard() {
        let board = GameBoard()
        
        for x in 0..<3 {
            for y in 0..<3 {
                let square = board[(x, y)]
                // We assume the square is nil, because it has no X or O mark
//                XCTAssert(square == nil)
                XCTAssertNil(square)
            }
        }
    }
    
    func testPlacingMarks() {
        
        var board = GameBoard()
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (0, 0)))
        // Easy way
        XCTAssertEqual(board[(0, 0)], .x)
        // another way
//        let zeroZeroMark = board[(0, 0)]
//        XCTAssert(zeroZeroMark == GameBoard.Mark.x)
        
        for x in 0..<3 {
                    for y in 0..<3 {
                        if x == 0 && y == 0 {
                            XCTAssert(board[(x, y)] == .x, "Expected X mark at 0, 0")
                            continue
                        }
                        XCTAssert(board[(x, y)] == nil)
                    }
                }
        // Make sure we can't change the mark on a square with an existing mark
        XCTAssertThrowsError(try board.place(mark: .x, on: (0, 0)))
    }
}
