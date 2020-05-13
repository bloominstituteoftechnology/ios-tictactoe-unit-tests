//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Mark Poggi on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testMakeMark() {
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        let coordinate: Coordinate = (0, 0)

       XCTAssertNoThrow(try! game.makeMark(at: coordinate))
    }

    func testOWin() {
        var game = Game(board: GameBoard(), gameIsOver: false, winningPlayer: nil)

        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (1, 2))

        XCTAssertTrue(game.isGameOver())
        XCTAssertEqual(GameBoard.Mark.o, game.getWinningPlayer())
    }

    func testXWin() {
        var game = Game(board: GameBoard(), gameIsOver: false, winningPlayer: nil)

        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 2))

        XCTAssertTrue(game.isGameOver())
        XCTAssertEqual(GameBoard.Mark.x, game.getWinningPlayer())
    }
    
    func testCatsGame() {
        var game = Game(board: GameBoard(), gameIsOver: false, winningPlayer: nil)

        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (1, 2))
        try! game.makeMark(at: (2, 2))

        XCTAssertTrue(game.isGameOver())
        XCTAssertNotEqual(GameBoard.Mark.x, game.getWinningPlayer())
        XCTAssertNotEqual(GameBoard.Mark.o, game.getWinningPlayer())
    }


}
