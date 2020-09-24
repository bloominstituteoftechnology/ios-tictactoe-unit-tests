//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Kenneth Jones on 9/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testNewGame() throws {
        let game = Game()
        
        XCTAssertTrue(game.gameIsOver == false)
        XCTAssertTrue(game.gameState == .active(.x))
    }
    
    func testRestart() throws {
        var game = Game()
        
        game.restart()
        XCTAssertTrue(game.gameIsOver == false)
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertTrue(game.gameState == .active(.x))
    }
    
    func testMakeMark() {
        var game = Game()
        game.restart()
        try! game.makeMark(at: (1, 1))
        
        for x in 0..<3 {
            for y in 0..<3 {
                if x == 1 && y == 1 { continue }
                XCTAssertNil(game.board[(x, y)])
            }
        }
    }

}
