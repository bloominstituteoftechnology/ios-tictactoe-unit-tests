//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Jessie Ann Griffin on 4/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testRestart() {
        
    }
    
    func testMakeMark() {
        var game = Game()
        let coordinate = (0,0)
        
        XCTAssertNoThrow(try game.makeMark(at: coordinate))
    }
}
