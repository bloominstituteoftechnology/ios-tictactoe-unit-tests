//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Yvette Zhukovsky on 12/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//
import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    var game: Game!
    override func setUp() {
        game = Game()
    }
    
    func testRestart() {
        
        game.restart()
        
        XCTAssertFalse(game.gameIsOver)
        XCTAssertTrue(game.activePlayer == .x) //checks that X is active player
        XCTAssertNil(game.winningPlayer)
    }
  
    
    func testCatsMark() {
        /*
         x o x
         x o o
         o x x
         
         */
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (1, 2))
        try! game.makeMark(at: (2, 2))
        XCTAssert(game.gameIsOver) //no one won the game
        XCTAssertNil(game.winningPlayer)
        XCTAssert(game.board.isFull)
        game.restart() //restarting the game
        XCTAssertFalse(game.gameIsOver)
         XCTAssertNil(game.winningPlayer)
        
}
    
    
    func testWinningGameX() {
    
        /*
         x o x
         o x -
         o - x
         */
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (2,2))
        
        XCTAssert(game.gameIsOver) //x won
        XCTAssertEqual(game.winningPlayer, .x)
        XCTAssertFalse(game.board.isFull)
        
        game.restart() //restarting the game
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
    }
    
    
    
}
