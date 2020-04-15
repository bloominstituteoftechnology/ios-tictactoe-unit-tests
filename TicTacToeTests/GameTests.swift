//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Karen Rodriguez on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testCreatingGame() {
        let game = Game()
        let board = game.board
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board[(x, y)])
            }
        }
    }
    
    func testPlacingMark() {
        var game = Game()
        let board = game.board
        
        // Should be X
        try! game.makeMark(at: (0, 1))
        XCTAssertEqual(board[(0, 1)], GameBoard.Mark.x)
        
        // Should be Y
        try! game.makeMark(at: (1,1))
        XCTAssertEqual(board[(1, 1)], GameBoard.Mark.o)
        
        // Check everything else remains
        for x in 0..<3 {
            for y in 0..<3 {
                if (x == 0 && y == 1) || (x == 1 && y == 1) { continue }
                XCTAssertNil(board[(x, y)])
            }
        }
    }

}
