//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Jorge Alvarez on 2/19/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    /// Checks to see if game is over?
    func testGameOver() {
        let board = GameBoard()
        XCTAssertTrue(game(board: board, isWonBy: .x))
    }
    
}
