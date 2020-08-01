//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Morgan Smith on 7/29/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {


    func testRestartGame() {
        var game = Game()
        var board = game.board
        try! board.place(mark: .x, on: (0, 0))

        //make sure mark is there
        XCTAssertEqual(board[(0,0)], .x)
        //check next active player is o
       // try! board.place(mark: .x, on: (1, 1))

    //    XCTAssertEqual(game.gameStatusLabel, "Player O's turn")
/*
        //try restarting game
        game.restart()

        //check that board is empty and active player is x
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board[(x, y)])
            }
        }
        XCTAssertEqual(game.activePlayer, .x)
         */
    }

    func testMakeMark() {
        var game = Game()
        var board = game.board
        

    }

}
