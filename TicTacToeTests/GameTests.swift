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
        var board = GameBoard()
        var game = Game(board: board, gameIsOver: true)
        try! board.place(mark: .x, on: (0, 0))
        XCTAssertEqual(board[(0,0)], .x)
        game.restart()


    }


}
