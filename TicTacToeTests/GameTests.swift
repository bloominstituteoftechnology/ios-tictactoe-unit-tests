//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Elizabeth Thomas on 7/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests : XCTestCase {
    
    func testMakeMark() {
        var testGame = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        
        try! testGame.makeMark(at: (0,0))
    }
    
    func testRestart() {
        var testGame = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        
        try! testGame.makeMark(at: (0,0))
        testGame.restart()
    }
    
}
