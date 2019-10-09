//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Jordan Christensen on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    func testGameRestarted() {
        var game = Game(board: GameBoard(), gameIsOver: true, winningPlayer: .x)
        let coordinate: Coordinate = (1, 1)
        
        XCTAssertNoThrow(try! game.makeMark(at: coordinate))
        game.restart()
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertEqual(game.board[(x, y)], nil)
            }
        }
    }
    
    func testGameMakeMark() {
        var game = Game(board: GameBoard(), gameIsOver: false, winningPlayer: nil)
        let coordinate: Coordinate = (1, 1)
        
        XCTAssertNoThrow(try! game.makeMark(at: coordinate))
        XCTAssertTrue(game.board[coordinate] != nil)
    }
}
