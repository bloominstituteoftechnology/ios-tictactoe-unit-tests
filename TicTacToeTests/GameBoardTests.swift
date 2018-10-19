//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Madison Waters on 10/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe // Don't forget this //

class GameBoardTests: XCTestCase {

    func testCreatingEmptyBoard() {
        let board = GameBoard()
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board[(x, y)])
            }
        }
    }
    
    func testPlacingMarks() {
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
    
    func testIsFull() {
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(board.isFull)
    }
    
}


///////// Guided Project Code /////////////


    func testIsThereAMarkAtZeroZero() {
        
        let board = GameBoard()

        let mark = board[(0, 0)]
        
        XCTAssertNil(mark)
    }
    
    func testCreatingEmptyBoard() {
        
        let board = GameBoard()
        
        for x in 0...2{
            for y in 0...2{
                let mark = board[(x, y)]
                XCTAssertNil(mark)
            }
        }
    }
    
    func testPlacingMarks() {
        
        var board = GameBoard()
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (0, 0)))
        // verify that 0, 0 has a mark now
        let mark = board[(0, 0)]
        XCTAssert(mark == .x)
        
        for x in 0...2{
            for y in 0...2{
                
                let mark = board[(x, y)]
                if x == 0 && y == 0 {
                    XCTAssertEqual(mark, .x)
                    continue
                }
                XCTAssertNil(mark)
            }
        }
        
    }

    func testBoardIsFull() {
        
        var board = GameBoard()
        
        // you could use the double for - in loop like previous tests for this
        try! board.place(mark: .x , on: (0, 0))
        try! board.place(mark: .x , on: (0, 1))
        try! board.place(mark: .x , on: (0, 2))
        try! board.place(mark: .x , on: (1, 0))
        try! board.place(mark: .x , on: (1, 1))
        try! board.place(mark: .x , on: (1, 2))
        try! board.place(mark: .x , on: (2, 0))
        try! board.place(mark: .x , on: (2, 1))
        try! board.place(mark: .x , on: (2, 2))
        
        XCTAssertTrue(board.isFull)
    }








