//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Bradley Yin on 9/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testGameResetToXStart() {
        var game = Game()
        game.makeMark(at: (0, 0))
        game.restart()
        
        XCTAssertEqual(.x, game.activePlayer)
        
        
    }
    
    func testMakeXMarkAtTopLeftCorner() {
        var game = Game()
        game.makeMark(at: (0, 0))
        
        XCTAssertEqual(.x, game.board[(0,0)])
        
    }
    
    func testSwitchPlayerAfterPlace() {
        var game = Game()
        game.makeMark(at: (0, 0))
        
        XCTAssertEqual(.o, game.activePlayer)
    }
    
    func testBoardFullGameIsOverNoWinner() {
        var game = Game()
        game.makeMark(at: (1,0))
        game.makeMark(at: (0,0))
        game.makeMark(at: (2,0))
        game.makeMark(at: (2,1))
        game.makeMark(at: (0,1))
        game.makeMark(at: (1,1))
        game.makeMark(at: (0,2))
        game.makeMark(at: (1,2))
        game.makeMark(at: (2,2))
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
    }
    
    func testXVerticalWinGameOver() {
        var game = Game()
        game.makeMark(at: (0,0))
        game.makeMark(at: (1,0))
        game.makeMark(at: (0,1))
        game.makeMark(at: (2,0))
        game.makeMark(at: (0,2))
        
        XCTAssertEqual(.x, game.winningPlayer)
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
    }
    
    func testOVerticalWinGameOver() {
        var game = Game()
        game.makeMark(at: (0,0))
        game.makeMark(at: (1,0))
        game.makeMark(at: (0,1))
        game.makeMark(at: (1,1))
        game.makeMark(at: (2,2))
        game.makeMark(at: (1,2))
        
        XCTAssertEqual(.o, game.winningPlayer)
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.activePlayer)
    }
}
