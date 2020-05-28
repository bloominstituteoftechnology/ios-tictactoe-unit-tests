//
//  GameAITest.swift
//  TicTacToeTests
//
//  Created by Lambda_School_loaner_226 on 5/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITest: XCTestCase {

    func testWinCheckingVertical1() {
        var board = GameBoard()
        /*
         X O -
         X O -
         X - -
         */
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }

}
