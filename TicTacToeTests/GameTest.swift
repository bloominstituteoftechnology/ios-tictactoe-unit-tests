//
//  GameTest.swift
//  TicTacToeTests
//
//  Created by Jerry haaser on 12/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTest: XCTestCase {

    func testXIsFirst() {
        var game = Game()
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.x)
    }
    
    
}
