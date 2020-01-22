//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Chad Rutherford on 1/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {
    
    func testCreatingEmptyBoard() {
        let board = GameBoard()
        
        for x in 0 ..< 3 {
            for y in 0 ..< 3 {
                XCTAssertNil(board[(x, y)], "The entry at (\(x), \(y)) was \(board[(x, y)]!) instead of nil")
            }
        }
    }
    
    func testPlacingMarks() {
        var board = GameBoard()
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 0)))
        XCTAssertEqual(board[(0, 0)], .o)
        XCTAssertNoThrow(try board.place(mark: .x, on: (2, 2)))
        XCTAssertEqual(board[(2, 2)], .x)
        XCTAssertThrowsError(try board.place(mark: .x, on: (2, 2))) { error in
            XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
        }
        
        for x in 0 ..< 3 {
            for y in 0 ..< 3 {
                if x == 0 && y == 0 { continue }
                if x == 2 && y == 2 { continue }
                XCTAssertNil(board[(x, y)], "The entry at (\(x), \(y)) was \(board[(x, y)]!) instead of nil")
            }
        }
    }
    
    func testBoardIsFull() {
        var board = GameBoard()
        
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (0, 0))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .o, on: (0, 1))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (1, 0))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .o, on: (2, 0))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (0, 2))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .o, on: (1, 1))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (2, 1))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(board.isFull)
    }
    
    func testStringValues() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 0))
        XCTAssertEqual(board[(0, 0)]?.stringValue, "X")
        XCTAssertNotEqual(board[(0, 0)]?.stringValue, "O")
        XCTAssertNotNil(board[(0, 0)]?.stringValue)
        
        try! board.place(mark: .o, on: (2, 2))
        XCTAssertEqual(board[(2, 2)]?.stringValue, "O")
        XCTAssertNotEqual(board[(2, 2)]?.stringValue, "X")
        XCTAssertNotNil(board[(2, 2)]?.stringValue)
    }
}
