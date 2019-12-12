//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Jon Bash on 2019-12-11.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    var game: Game!

    override func setUp() {
        game = Game()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInvalidMark() {
        
    }
    
    func testGameOver() {
        
    }
    
    func testXWins() {
        
    }
    
    func testOWins() {
        
    }

    func testSwitchingPlayers() {
        /*
         x o x
         o x -
         x o -
         */
        var currentPlayer = GameBoard.Mark.x
        loopThroughBoard { (x, y) in
            if x == 2 && y > 0 { return }
            
            XCTAssertEqual(currentPlayer, game.activePlayer)
            try! game.makeMark(at: (x, y))
            currentPlayer.toggle() // toggles to other player after win
        }
        XCTAssertNotEqual(game.winningPlayer!, currentPlayer)
        XCTAssertTrue(game.gameIsOver)
    }
    
    func testCatsGame() {
        /*
         o x x
         x o o
         o x x
         */
        loopThroughBoard { (x, y) in
            XCTAssertFalse(game.gameIsOver)
            let newX: Int
            switch x {
            case 0: newX = 1
            case 1: newX = 0
            default: newX = x
            }
            try! game.makeMark(at: (newX, y))
        }
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
    }
    
    func makeMarks(_ coords: [Coordinate]) {
        for coord in coords {
            try! game.makeMark(at: coord)
        }
    }
}
