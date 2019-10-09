//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Jake Connerly on 10/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testNewGame() {
        let game = Game()
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNotNil(game.activePlayer)
        XCTAssertNil(game.winningPlayer)
    }
    
    func testMakingMark() {
        var game = Game()
        try! game.makeMark(at: (0, 0))
        XCTAssertNoThrow(try! game.makeMark(at: (0, 0)))
        XCTAssertNoThrow(try! game.makeMark(at: (0, 1)))
        XCTAssertNoThrow(try! game.makeMark(at: (0, 2)))
        
        XCTAssertThrowsError(try! game.makeMark(at: (0, 0)))
    }
    
    func testGameWithWin() {
        /*
         
         */
        
    }
    
    func testCatGame() {
        
    }
    
    func testRestartWithNoWin() {
        
    }

}
