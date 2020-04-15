//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Karen Rodriguez on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testCreatingGame() {
        var game = Game()
        let board = game.board
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board[(x, y)])
            }
        }
    }

}
