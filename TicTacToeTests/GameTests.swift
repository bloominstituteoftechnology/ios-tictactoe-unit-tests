//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Ilgar Ilyasov on 10/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    var game = Game()
    
    func testRestart() {
        game.restart() // Start game
        
        XCTAssertFalse(game.gameIsOver) // Make sure game is not over
        XCTAssertNil(game.winnigPlayer) // Make sure there is not a winnig player
        XCTAssertEqual(game.activePlayer, .x) // Make sure first player is .x
    }
    
    func testMakeMark() {
        let coordinate = (1, 2)
        
        XCTAssertEqual(game.activePlayer, .x) // Check first player
        XCTAssertNoThrow(try game.makeMark(at: coordinate)) // Make a mark
        XCTAssertEqual(game.activePlayer, .o) // Check if it's changing to second player
        XCTAssertFalse(game.board.isFull)
    }
    
}
