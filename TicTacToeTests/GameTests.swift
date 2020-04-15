//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Shawn Gee on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testActivePlayer() throws {
        var game = Game()
        XCTAssertEqual(game.activePlayer, .x)
        
        try game.makeMark(at: (0,0))
        XCTAssertEqual(game.activePlayer, .o)
        
        try game.makeMark(at: (1,1))
        XCTAssertEqual(game.activePlayer, .x)
    }
    
    func testGameIsOver() {
        
    }
    
    func testWinningPlayer() {
        
    }
    
    func testRestart() {
        
    }
    
    func testMakeMark() {
        
    }
    

}
