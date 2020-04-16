//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Lambda_School_Loaner_259 on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {

    func testCreatingEmptyBoard() {
        let board = GameBoard()
        
        //XCTAssert(board[(x: 0, y: 0)] == nil)
        XCTAssertNil(board[(x: 0, y: 0)])
        XCTAssertNil(board[(x: 1, y: 0)])
        XCTAssertNil(board[(x: 2, y: 0)])
        
        XCTAssertNil(board[(x: 0, y: 1)])
        XCTAssertNil(board[(x: 1, y: 1)])
        XCTAssertNil(board[(x: 2, y: 1)])
        
        XCTAssertNil(board[(x: 0, y: 2)])
        XCTAssertNil(board[(x: 1, y: 2)])
        XCTAssertNil(board[(x: 2, y: 2)])
        
        
        for y in 0...2 {
            for x in 0...2 {
                XCTAssertNil(board[(x, y)])
            }
        }
    }
    
    func testPlacingMarks() {
            var board = GameBoard()
    //        try! board.place(mark: .o, on: (0, 0))
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
                    XCTAssertNil(board[(x, y)], ":warning: The entry at (\(x), \(y)) was \(board[(x, y)]!) instead of nil :(.")
                }
            }
            XCTAssertThrowsError(try board.place(mark: .o, on: (2, 2))) { (error) in
                XCTAssertEqual(error as? GameBoardError, .invalidSquare)
            }
        }
    
    func testIsFull() {
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
    
    func testMarkStringValues() {
        let xMark = GameBoard.Mark.x
        
        XCTAssertEqual(xMark.stringValue, "X")
        
        let oMark = GameBoard.Mark.o
        
        XCTAssertEqual(oMark.stringValue, "O")
        
    }

}
