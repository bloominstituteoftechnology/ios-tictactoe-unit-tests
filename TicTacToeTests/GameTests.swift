//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Conner on 9/12/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testGameMakeMark() {
        var game = Game(board: GameBoard(),
                        activePlayer: .o,
                        winningPlayer: nil)
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (0, 2))
        XCTAssertEqual(.o, game.board[(0, 0)])
        XCTAssertEqual(.x, game.board[(0, 1)])
        XCTAssertEqual(.o, game.board[(0, 2)])
    }
    
    func testGameRestartWillResetBoard() {
        var game = Game(board: GameBoard(),
                        activePlayer: .o,
                        winningPlayer: nil)
        
        try! game.makeMark(at: (0, 0)) // Place .o at (0, 0)
        XCTAssertEqual(.o, game.board[(0, 0)]) // Make sure it's there
        
        game.restart() // Restart
        try! game.makeMark(at: (0, 0)) // Place .x at (0, 0)
        
        XCTAssertNotEqual(.o, game.board[(0, 0)])
        XCTAssertEqual(.x, game.board[(0, 0)])
    }
    
    func testGameCanHaveWinner() {
        var game = Game(board: GameBoard(),
                        activePlayer: .x,
                        winningPlayer: nil)
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 2))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (2, 2))
        
        XCTAssertEqual(game.winningPlayer, .x)
        XCTAssertTrue(game.gameIsOver)
    }
    
}
