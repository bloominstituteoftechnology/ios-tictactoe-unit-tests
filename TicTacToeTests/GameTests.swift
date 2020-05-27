//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Claudia Contreras on 5/26/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testRestart() throws {
        let board = GameBoard()
        let game = Game()
        
        // Make sure the board is empty
        XCTAssertTrue(board.isEmpty)
        
        // Make sure that the player starting is X
        XCTAssertEqual(game.activePlayer, .x)
    }
}
