//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by dillon on 11/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

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
        XCTAssertEqual(board[(0, 0)], .o) // if we place an "o" at (0,0) is it equal to "o"
        XCTAssertNoThrow(try board.place(mark: .x, on: (2, 2)))
        XCTAssertEqual(board[(2, 2)], .x) // if we place an "o" at (0,0) is it equal to "o"
        
        for x in 0..<3 {
            for y in 0..<3 {
                if x == 0 && y == 0 { continue }
                if x == 2 && y == 2 { continue }
                XCTAssertNil(board[(x, y)])
            }
        }
        
        // we're going to try to place an x at 0,0; if we try to add an x then it should throw an error because its already filled. Then use closure to check whether the error is truly an invalid square error. we're downcasting this error as type of GameBoardError
        XCTAssertThrowsError(try board.place(mark: .x, on: (0, 0))) { (error) in
            XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
        }
        
        /// if you're certain that testing code is correct, then you can narrow down where the problem in code lies. Very powerful in large apps especially when making changes
//        XCTAssertNoThrow(try board.place(mark: .x, on: (0, 0)))
        
    }
    
    
}
