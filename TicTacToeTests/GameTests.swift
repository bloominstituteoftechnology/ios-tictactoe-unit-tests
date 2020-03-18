//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Chris Gonzales on 3/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {


    func testRestart() {
        var board = GameBoard()
        XCTAssertTrue(board.isEmpty)
    }
    
    func testMakeMark() {
        
    }

}
