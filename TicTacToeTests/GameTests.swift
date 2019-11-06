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
        XCTAssertNil(game.board[(0, 0)])
        
        
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
    
    func testMakeMarkSaveToMoves() {
        var game = Game()
        game.makeMark(at: (0,0))
        
        XCTAssertEqual(1, game.moves.count)
    }
    
    func testRemovingMarkMakeThatSquareNil() {
        var game = Game()
        game.makeMark(at: (0,0))
        game.makeMark(at: (1,0))
        game.removeLastMark()
        
        XCTAssertNil(game.board[(1,0)])
    }
    
    func testRemovingMarkRevertActivePlayer() {
        var game = Game()
        game.makeMark(at: (0,0))
        game.makeMark(at: (1,0))
        game.removeLastMark()
        
        XCTAssertEqual(.o, game.activePlayer)
    }
    
    func testResetGameWinningPlayerNil() {
        var game = Game()
        game.makeMark(at: (0,0))
        game.makeMark(at: (1,0))
        game.makeMark(at: (0,1))
        game.makeMark(at: (1,1))
        game.makeMark(at: (2,2))
        game.makeMark(at: (1,2))
        game.restart()
        XCTAssertNil(game.winningPlayer)
    }
    
    func testResetGameResetGameOver() {
        var game = Game()
        game.makeMark(at: (0,0))
        game.makeMark(at: (1,0))
        game.makeMark(at: (0,1))
        game.makeMark(at: (1,1))
        game.makeMark(at: (2,2))
        game.makeMark(at: (1,2))
        game.restart()
        XCTAssertFalse(game.gameIsOver)
    }
    
    func testUndoRemoveLastElementOfArray() {
        var game = Game()
        game.makeMark(at: (0,0))
        game.makeMark(at: (1,0))
        game.makeMark(at: (0,1))
        game.makeMark(at: (1,1))
        
        game.removeLastMark()
        game.removeLastMark()
        
        XCTAssertEqual(2, game.moves.count)
    }
    

}
