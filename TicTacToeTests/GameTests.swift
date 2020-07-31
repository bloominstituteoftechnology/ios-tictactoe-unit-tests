//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Josh Kocsis on 7/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil, gameState: .active(.x))

    func testCatsGame() {

        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (2,1))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,2))
        try! game.makeMark(at: (1,2))
        try! game.makeMark(at: (0,2))

        XCTAssertEqual(game.gameState, .cat)
        
    }

    func testXWon() {

        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,0))

        XCTAssertEqual(game.gameState, .won(.x))
    }

    func testOWon() {

        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (2,1))

        XCTAssertEqual(game.gameState, .won(.o))
    }
}
