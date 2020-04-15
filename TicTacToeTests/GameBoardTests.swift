//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Mark Gerrior on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {

    func testCreatingEmptyBoard() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let board = GameBoard()
        
//        XCTAssert(board[(x: 0, y: 0)] == nil)
        // check the first row
        XCTAssertNil(board[(x: 0, y: 0)])
        XCTAssertNil(board[(x: 1, y: 0)])
        XCTAssertNil(board[(x: 2, y: 0)])

        // check the second row
        XCTAssertNil(board[(x: 0, y: 1)])
        XCTAssertNil(board[(x: 1, y: 1)])
        XCTAssertNil(board[(x: 2, y: 1)])

        // check the third row
        XCTAssertNil(board[(x: 0, y: 2)])
        XCTAssertNil(board[(x: 1, y: 2)])
        XCTAssertNil(board[(x: 2, y: 2)])
        
        for y in 0...2 {
            for x in 0...2 {
                XCTAssertNil(board[(x: x, y: y)], "⚠️ The entry at x \(x), y \(y) was \(board[(x: x, y: y)]!) instead of nil")
            }
        }
    }

}
