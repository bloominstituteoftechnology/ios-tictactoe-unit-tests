//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Austin Cole on 1/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {

    func testCreatingEmptyBoard() {
        let board = GameBoard()
        
        XCTAssertFalse(board.isFull)
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board[(x, y)])
                    // Test Failed
            }
        }
    }
    
    func testPlacingMarks() {
        var board = GameBoard()
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 0)))
        XCTAssertEqual(board[(0, 0)], .o)
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 1)))
        XCTAssertEqual(board[(0, 1)], .o)
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 2)))
        XCTAssertEqual(board[(0, 2)], .o)
        XCTAssertNoThrow(try board.place(mark: .o, on: (1, 0)))
        XCTAssertEqual(board[(1, 0)], .o)
        XCTAssertNoThrow(try board.place(mark: .o, on: (1, 1)))
        XCTAssertEqual(board[(1, 1)], .o)
        XCTAssertNoThrow(try board.place(mark: .o, on: (1, 2)))
        XCTAssertEqual(board[(1, 2)], .o)
        XCTAssertNoThrow(try board.place(mark: .o, on: (2, 0)))
        XCTAssertEqual(board[(2, 0)], .o)
        XCTAssertNoThrow(try board.place(mark: .o, on: (2, 1)))
        XCTAssertEqual(board[(2, 1)], .o)
        XCTAssertNoThrow(try board.place(mark: .o, on: (2, 2)))
        XCTAssertEqual(board[(2, 2)], .o)
        
        //Make sure you can't change an already-marked square
        XCTAssertThrowsError(try board.place(mark: .x, on: (0, 0))) { error in
            XCTAssertEqual(error as? GameBoardError, .invalidSquare)
        }
    }
    
    func testFillingTheBoard() {
        var board = GameBoard()
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertFalse(board.isFull)
                try! board.place(mark: .x, on: (x, y))
                
                // Test Failed
            }
        }
    }
    
}
