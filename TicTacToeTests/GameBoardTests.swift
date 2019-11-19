//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by John Kouris on 11/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {

    func testCreatingEmptyBoard() {
        let board = GameBoard()
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board[(x,y)])
            }
        }
    }

}
