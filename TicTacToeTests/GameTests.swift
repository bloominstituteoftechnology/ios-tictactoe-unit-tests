//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Jonathan Ferrer on 6/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe
class GameTests: XCTestCase {

    func testRestart() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .x, gameIsOver: false, winningPlayer: nil)

        game.restart()
        XCTAssertTrue(.x == game.activePlayer)
        XCTAssertFalse(.o == game.activePlayer)
    }


    func testWin() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        try! game.makeMark(at: (0, 0))

        try! game.makeMark(at: (1,0))

        try! game.makeMark(at: (0,1))

        try! game.makeMark(at: (1,1))
        
        try! game.makeMark(at: (0,2))
        XCTAssertTrue(game.gameIsOver)
        XCTAssertTrue(game.winningPlayer == .x)
        XCTAssertFalse(game.winningPlayer == .o)
        
    }


    func testPlayerChange() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .x, gameIsOver: false, winningPlayer: nil)

        try! game.makeMark(at: (0,0))

        XCTAssertTrue(game.activePlayer == .o)
        XCTAssertFalse(game.activePlayer == .x)
    }

    

}
