//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Kelson Hartle on 6/10/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe
class GameTests: XCTestCase {

    func testRestart() {
        let board = GameBoard()
        var game = Game()
        
        XCTAssertFalse(game.gameIsOver)
        game.restart()
        XCTAssertTrue(board.isEmpty)
        
    }
    
    func testMakeMark() {
        let board = GameBoard()
        var game = Game()
        /*
        o - -
        - - x
        - o x
        */
        
        
        try! game.makeMark(at: (2,1))
        try! game.makeMark(at: (2,2))
        try! game.makeMark(at: (1,2))
        try! game.makeMark(at: (0,0))

        XCTAssertFalse(game.gameIsOver)
        XCTAssertFalse(board.isFull)
        
    }
    

}
