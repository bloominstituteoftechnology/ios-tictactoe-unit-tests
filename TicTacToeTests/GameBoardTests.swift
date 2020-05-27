//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Breena Greek on 5/26/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@ testable import TicTacToe

class GameBoardTests: XCTestCase {

    func testCreatingEmptyBoard() {
       let board = GameBoard()
        
//        XCTAssert(board[(x: 0, y: 0)] == nil)
        // Check the first row
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
                XCTAssertNil(board[(x, y)], "⚠️ The entry at (\(x), \(y)) was \(board[(x, y)]!) instead of nil: (.")
            }
        }
    }
}
