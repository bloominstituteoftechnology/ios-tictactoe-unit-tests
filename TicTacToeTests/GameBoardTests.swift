//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Dimitri Bouniol Lambda on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {

    func testCreatingEmptyBoard() throws {
        let board = GameBoard()
        
//        if board[(x: 0, y: 0)] == nil {
//            // yay, the test passed!
//        }
//        XCTAssert(board[(x: 0, y: 0)] == nil)
        
        // Check the first row
        XCTAssertNil(board[(x: 0, y: 0)])
        XCTAssertNil(board[(x: 1, y: 0)])
        XCTAssertNil(board[(x: 2, y: 0)])
        
        // Check the second row
        XCTAssertNil(board[(x: 0, y: 1)])
        XCTAssertNil(board[(x: 1, y: 1)])
        XCTAssertNil(board[(x: 2, y: 1)])
        
        // Check the third row
        XCTAssertNil(board[(x: 0, y: 2)])
        XCTAssertNil(board[(x: 1, y: 2)])
        XCTAssertNil(board[(x: 2, y: 2)])
        
        // Check all rows at once
        for y in 0...2 {
            for x in 0...2 {
                XCTAssertNil(board[(x, y)], "⚠️ The entry at (\(x), \(y)) was \(board[(x, y)]!) instead of nil :(.")
            }
        }
    }
    
    func testPlacingMarks() {
        var board = GameBoard()
        
//        try board.place(mark: .o, on: (0, 0))
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 0)))
        XCTAssertEqual(board[(0, 0)], .o)
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (2, 2)))
        XCTAssertEqual(board[(2, 2)], .x)
        
        // Make sure things don't change if we place an O on the same tile
        XCTAssertThrowsError(try board.place(mark: .o, on: (2, 2)))
        XCTAssertEqual(board[(2, 2)], .x)
        
        for y in 0...2 {
            for x in 0...2 {
                if x == 0 && y == 0 { continue }
                if x == 2 && y == 2 { continue }
                
                XCTAssertNil(board[(x, y)], "⚠️ The entry at (\(x), \(y)) was \(board[(x, y)]!) instead of nil :(.")
            }
        }
        
        XCTAssertThrowsError(try board.place(mark: .o, on: (2, 2))) { (error) in
            XCTAssertEqual(error as? GameBoardError, .invalidSquare)
        }
    }
    
    func testIsFull() throws {
        var board = GameBoard()
        
        XCTAssertFalse(board.isFull)
        
        try board.place(mark: .x, on: (0, 0))
        XCTAssertFalse(board.isFull)
        
        try board.place(mark: .o, on: (0, 1))
        XCTAssertFalse(board.isFull)
        
        try board.place(mark: .x, on: (1, 0))
        XCTAssertFalse(board.isFull)
        
        try board.place(mark: .o, on: (2, 0))
        XCTAssertFalse(board.isFull)
        
        try board.place(mark: .x, on: (0, 2))
        XCTAssertFalse(board.isFull)
        
        try board.place(mark: .o, on: (1, 1))
        XCTAssertFalse(board.isFull)
        
        try board.place(mark: .x, on: (2, 1))
        XCTAssertFalse(board.isFull)
        
        try board.place(mark: .o, on: (1, 2))
        XCTAssertFalse(board.isFull)
        
        try board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(board.isFull)
    }
    
    func testMarkStringValues() {
        let xMark = GameBoard.Mark.x
        XCTAssertEqual(xMark.stringValue, "X")
        
        let oMark = GameBoard.Mark.o
        XCTAssertEqual(oMark.stringValue, "O")
    }

}
