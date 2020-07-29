//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by David Williams on 7/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

@testable import TicTacToe

class GameBoardTests: XCTestCase {

    
    func testCreatingEmptyBoard() {
        let board = GameBoard()
        // Goal: Make sure the board is empty right after it's initializ
        for x in 0..<3 {
            for y in 0..<3 {
                let square = board[(x, y)]
                // We assume the square is nil, because it has no X or O mark
                XCTAssertNil(square)
            }
        }
    }
    
    func testPlacingMarks() {
        
        var board = GameBoard()
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (0, 0)))
        XCTAssertEqual(board[(0, 0)], .x)
        
        for x in 0..<3 {
            for y in 0..<3 {
                if x == 0 && y == 0 {
                    XCTAssert(board[(x, y)] == .x)
                    continue
                }
                XCTAssert(board[(x, y)] == nil)
            }
        }
        // Make sure we can't change the mark on a square with an existing mark
        XCTAssertThrowsError(try board.place(mark: .x, on: (0, 0)))
//     -- XCTAssert(board[(x, y)] == .x) the same as --
//        let zeroZeroMark = board[(0, 0)]
//        XCTAssert(zeroZeroMark == GameBoard.Mark.o)
    }
}
