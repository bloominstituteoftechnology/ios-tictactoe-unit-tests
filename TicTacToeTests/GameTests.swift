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
        
        game.restart()
    }
    
}
