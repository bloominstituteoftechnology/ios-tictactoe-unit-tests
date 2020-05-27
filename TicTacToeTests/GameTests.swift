//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Matthew Martindale on 5/26/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testRestart() {
        var board = GameBoard()
        var game = Game(board: board)
        
        try! board.place(mark: .x, on: (0, 2))
        
        XCTAssertNotNil(board[(0, 2)])
        XCTAssertNil(board[(1, 1)])
        
        game.restart()
        
        for x in 0...2 {
            for y in 0...2 {
                XCTAssertNil(board[(x, y)])
            }
        }
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertFalse(game.activePlayer == .o)
    }
    
    func testMakeMark() {
        var board = GameBoard()
        var game = Game(board: board)
        
        try! board.place(mark: .x, on: (1, 1))
        
        XCTAssertNotNil(board[(1, 1)])
    }

}
