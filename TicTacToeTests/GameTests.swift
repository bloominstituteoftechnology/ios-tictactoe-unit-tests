//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Thomas Cacciatore on 6/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testRestart() {
        var board = GameBoard()
        //game board should be empty
        //game state should restart and be active
        XCTAssertTrue(board.isEmpty)
        XCTAssertFalse(board.isFull)
    }
 
    
    func testMakeMark() {
        
    }

}
