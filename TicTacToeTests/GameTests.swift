//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Wyatt Harrell on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testCreatingEmptyBoard() {
        let game = Game()

        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(game.board[(x, y)])
            }
        }
    }
    
    func testMakingMark() {
        var game = Game()
        
        XCTAssertNil(game.board[(1, 1)])
        try! game.makeMark(at: (1, 1))
        XCTAssertNotNil(game.board[(1, 1)])
        XCTAssertEqual(game.board[(1, 1)], GameBoard.Mark.x)
        
        XCTAssertNil(game.board[(0, 0)])
        try! game.makeMark(at: (0, 0))
        XCTAssertNotNil(game.board[(0, 0)])
        XCTAssertNotEqual(game.board[(0, 0)], GameBoard.Mark.x)
        XCTAssertEqual(game.board[(0, 0)], GameBoard.Mark.o)
    }
    
    func testRetartingBoard() {
        var game = Game()

        try! game.makeMark(at: (1, 1))

        XCTAssertNotNil(game.board[(1, 1)])
        
        game.restart()
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(game.board[(x, y)])
            }
        }
    }
    
    func testWinningPlayerX() {
        
    }
    
    func testWinningPlayerO() {
        
    }

    func testActivePlayer() {
        
    }
    
    func testGameIsOver() {
        
    }
    

}
