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
    // MARK: - Setup
    
    var game: Game!

    override func setUp() {
        game = Game()
    }
    
    // MARK: - Tests
    
    func testInvalidMarks() {
        loopThroughBoard { (x, y) in
            if x == 2 && y > 0 {
                XCTAssertThrowsError(try game.makeMark(at: (x, y))) {
                    XCTAssertEqual($0 as! GameBoardError, .gameIsOver)
                }
                return
            }
            
            try! game.makeMark(at: (x, y))
            
            XCTAssertThrowsError(try game.makeMark(at: (x, y))) {
                if x != 2 {
                    XCTAssertEqual($0 as! GameBoardError, .invalidSquare)
                } else {
                    XCTAssertEqual($0 as! GameBoardError, .gameIsOver)
                }
            }
        }
    }
    
    func testSingleInvalidMark() {
        let coord = (0, 0)
        try! game.makeMark(at: coord)
        
        XCTAssertThrowsError(try game.makeMark(at: coord)) {
            XCTAssertEqual($0 as! GameBoardError, .invalidSquare)
        }
    }
    
    func testXWins1() {
        /*
         x o x
         o x -
         x o -
         */
        loopThroughBoard { (x, y) in
            if x == 2 && y > 0 { return }
            try! game.makeMark(at: (x, y))
        }
        XCTAssertEqual(game.winningPlayer!, .x)
        XCTAssertTrue(game.gameIsOver)
    }
    
    func testXWins2() {
        /*
         x o -
         x o -
         x - -
         */
        for y in 0...2 {
            for x in 0...1 {
                if (x, y) == (1, 2) {
                    continue
                } else {
                    XCTAssertFalse(game.gameIsOver)
                    try! game.makeMark(at: (x, y))
                }
            }
        }
        XCTAssertTrue(game.gameIsOver)
        XCTAssertEqual(game.winningPlayer!, .x)
    }
    
    func testXWins3() {
        /*
         x x x
         o o -
         - - -
         */
        for x in 0...2 {
            for y in 0...1 {
                if (x, y) == (2, 1) {
                    continue
                } else {
                    XCTAssertFalse(game.gameIsOver)
                    try! game.makeMark(at: (x, y))
                }
            }
        }
        XCTAssertTrue(game.gameIsOver)
        XCTAssertEqual(game.winningPlayer!, .x)
    }
    
    func testOWins1() {
        /*
         o x -
         o - x
         o - x
         */
        makeMarks([(1,0), (0,0), (2,1), (0,1), (2,2), (0,2)])
        XCTAssertEqual(game.winningPlayer!, .o)
        XCTAssertTrue(game.gameIsOver)
    }
    
    func testOWins2() {
        /*
         o x o
         x o x
         o x -
         */
        loopThroughBoard { (x, y) in
            if (x, y) == (2, 2) {
                XCTAssertTrue(game.gameIsOver)
                return
            }
            
            XCTAssertFalse(game.gameIsOver)
            
            var newX = x
            if x == 0 { newX = 1}
            else if x == 1 { newX = 0 }
            
            let newY = (x == 2) ? (y + 2) % 3 : y
            
            try! game.makeMark(at: (newX, newY))
        }
        XCTAssertEqual(game.winningPlayer!, .o)
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
            
            var newX: Int = x
            if x == 0 { newX = 1 }
            else if x == 1 { newX = 0 }
            
            try! game.makeMark(at: (newX, y))
        }
        XCTAssertTrue(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
    }
    
    func testRestart1() {
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
        XCTAssertEqual(game.activePlayer!, .x)
        
        loopThroughBoard { (x, y) in
            if x == 2 && y > 0 { return }
            try! game.makeMark(at: (x, y))
        }
        XCTAssertEqual(game.winningPlayer!, .x)
        XCTAssertTrue(game.gameIsOver)
        
        game.restart()
        
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
        XCTAssertEqual(game.activePlayer!, .x)
    }
    
    func testRestart2() {
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
        XCTAssertEqual(game.activePlayer!, .x)
        
        game.restart()
        
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
        XCTAssertEqual(game.activePlayer!, .x)
        
        game.restart()
        
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
        XCTAssertEqual(game.activePlayer!, .x)
    }
    
    // MARK: - Helper Methods
    
    func makeMarks(_ coords: [Coordinate]) {
        for coord in coords {
            try! game.makeMark(at: coord)
        }
    }
}
