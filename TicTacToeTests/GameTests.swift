//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Karen Rodriguez on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testCreatingGame() {
        let game = Game(board: GameBoard())

        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(game.board[(x, y)])
            }
        }
    }
    
    func testPlacingMark() {
        var game = Game(board: GameBoard())
//        let board = game.board
        // My dumbass failed to realize that when using a struct, the code above would pass by creating a new instance. There goes a good 30 minutes of trying to figure out where I was wrong!!!!!.
        
        // Should be X
        
        XCTAssertNoThrow(try game.makeMark(at: (0, 1)))
        XCTAssertNotNil(game.board[(0, 1)])
        XCTAssertEqual(game.board[(0, 1)], .x)
        
        // Should be Y
        XCTAssertNoThrow(try game.makeMark(at: (2,1)))
        XCTAssertNotNil(game.board[(2, 1)])
        XCTAssertEqual(game.board[(2, 1)], .o)
        
        // Check everything else remains
        for x in 0..<3 {
            for y in 0..<3 {
                if (x == 0 && y == 1) || (x == 2 && y == 1) { continue }
                XCTAssertNil(game.board[(x, y)])
            }
        }
    }
    
    func testIsFull() {
        var game = Game(board: GameBoard())
        
        /*
        o o x
        x x o
        o x x
        */
        
        try! game.makeMark(at: (2,0)) // x
        try! game.makeMark(at: (0,0)) // o
        try! game.makeMark(at: (0,1)) // x
        try! game.makeMark(at: (1,0)) // o
        try! game.makeMark(at: (1,1)) // x
        try! game.makeMark(at: (2,1)) // o
        try! game.makeMark(at: (1,2)) // x
        try! game.makeMark(at: (0,2)) // o
        XCTAssertFalse(game.board.isFull)
        
        try! game.makeMark(at: (2,2)) // x
        XCTAssertTrue(game.board.isFull)
    }
    
    func testWinCheckingVertical1() {
        var gameSession = Game(board: GameBoard())
           /*
           x o -
           x o -
           x - -
           */
//           try! game.board.place(mark: .x, on: (0, 0))
        try! gameSession.makeMark(at: (0,0))
//           try! game.board.place(mark: .o, on: (1, 0))
        try! gameSession.makeMark(at: (1,0))
//           try! game.board.place(mark: .x, on: (0, 1))
        try! gameSession.makeMark(at: (0,1))
//           try! game.board.place(mark: .o, on: (1, 1))
        try! gameSession.makeMark(at: (1,1))
//           try! game.board.place(mark: .x, on: (0, 2))
        try! gameSession.makeMark(at: (0,2))
        
           XCTAssertTrue(game(board: gameSession.board, isWonBy: .x))
           XCTAssertFalse(game(board: gameSession.board, isWonBy: .o))
       }
       
       
    func testWinCheckingHorizontal1() {
        var gameSession = Game(board: GameBoard())
           /*
            - o -
            x x x
            o - -
            */
           
           
        try! gameSession.makeMark(at: (1,1))
        XCTAssertFalse(game(board: gameSession.board, isWonBy: .x))
           XCTAssertFalse(game(board: gameSession.board, isWonBy: .o))
           XCTAssertFalse(gameSession.board.isFull)
           
        try! gameSession.makeMark(at: (1,0))
           XCTAssertFalse(game(board: gameSession.board, isWonBy: .x))
           XCTAssertFalse(game(board: gameSession.board, isWonBy: .o))
           XCTAssertFalse(gameSession.board.isFull)
           
        try! gameSession.makeMark(at: (0,1))
           XCTAssertFalse(game(board: gameSession.board, isWonBy: .x))
           XCTAssertFalse(game(board: gameSession.board, isWonBy: .o))
           XCTAssertFalse(gameSession.board.isFull)
           
        try! gameSession.makeMark(at: (0,2))
           XCTAssertFalse(game(board: gameSession.board, isWonBy: .x))
           XCTAssertFalse(game(board: gameSession.board, isWonBy: .o))
           XCTAssertFalse(gameSession.board.isFull)
           
        try! gameSession.makeMark(at: (2,1))
           XCTAssertTrue(game(board: gameSession.board, isWonBy: .x))
           XCTAssertFalse(game(board: gameSession.board, isWonBy: .o))
           XCTAssertFalse(gameSession.board.isFull)
       }
       
    func testWinCheckingDiagonal1() {
        var gameSession = Game(board: GameBoard())
        /*
        x - -
        - x -
        o o x
        */
        
        try! gameSession.makeMark(at: (1, 1))
        XCTAssertFalse(game(board: gameSession.board, isWonBy: .o))
        XCTAssertFalse(game(board: gameSession.board, isWonBy: .x))
        XCTAssertFalse(gameSession.board.isFull)
        
        try! gameSession.makeMark(at: (1, 2))
        XCTAssertFalse(game(board: gameSession.board, isWonBy: .o))
        XCTAssertFalse(game(board: gameSession.board, isWonBy: .x))
        XCTAssertFalse(gameSession.board.isFull)
        
        try! gameSession.makeMark(at: (0, 0))
        XCTAssertFalse(game(board: gameSession.board, isWonBy: .o))
        XCTAssertFalse(game(board: gameSession.board, isWonBy: .x))
        XCTAssertFalse(gameSession.board.isFull)
        
        try! gameSession.makeMark(at: (0, 2))
        XCTAssertFalse(game(board: gameSession.board, isWonBy: .o))
        XCTAssertFalse(game(board: gameSession.board, isWonBy: .x))
        XCTAssertFalse(gameSession.board.isFull)
        
        try! gameSession.makeMark(at: (2, 2))
        XCTAssertTrue(game(board: gameSession.board, isWonBy: .x))
        XCTAssertFalse(game(board: gameSession.board, isWonBy: .o))
        XCTAssertFalse(gameSession.board.isFull)
    }
       
       func testWinCheckingDiagonal2() {
           var board = Game(board: GameBoard()).board
           /*
            x - o
            - o -
            o x -
            */
           try! board.place(mark: .o, on: (1, 1))
           XCTAssertFalse(game(board: board, isWonBy: .o))
           XCTAssertFalse(game(board: board, isWonBy: .x))
           XCTAssertFalse(board.isFull)
           
           try! board.place(mark: .x, on: (0, 0))
           XCTAssertFalse(game(board: board, isWonBy: .o))
           XCTAssertFalse(game(board: board, isWonBy: .x))
           XCTAssertFalse(board.isFull)
           
           try! board.place(mark: .o, on: (0, 2))
           XCTAssertFalse(game(board: board, isWonBy: .o))
           XCTAssertFalse(game(board: board, isWonBy: .x))
           XCTAssertFalse(board.isFull)
           
           try! board.place(mark: .x, on: (1, 2))
           XCTAssertFalse(game(board: board, isWonBy: .o))
           XCTAssertFalse(game(board: board, isWonBy: .x))
           XCTAssertFalse(board.isFull)
           
           try! board.place(mark: .o, on: (2, 0))
           XCTAssertTrue(game(board: board, isWonBy: .o))
           XCTAssertFalse(game(board: board, isWonBy: .x))
           XCTAssertFalse(board.isFull)
       }
       
       func testIncompleteGame() {
           var board = Game(board: GameBoard()).board
           /*
           o o -
           x o o
           o x x
           */
           
           try! board.place(mark: .o, on: (1, 1))
           try! board.place(mark: .x, on: (1, 2))
           try! board.place(mark: .o, on: (2, 1))
           try! board.place(mark: .x, on: (0, 1))
           try! board.place(mark: .o, on: (0, 0))
           try! board.place(mark: .x, on: (2, 2))
           try! board.place(mark: .o, on: (1, 0))
           
           // Is the game not full?
           XCTAssertFalse(board.isFull)
           // Did x not win?
           XCTAssertFalse(game(board: board, isWonBy: .x))
           // Did o not win?
           XCTAssertFalse(game(board: board, isWonBy: .o))
           // Is it not a cat game?
           /*
            My logic is as follows:
               If after filling all but one of the boxes game still doesn't consider any player to have won, and the board is also not considered full, then it's safe to say we can tell that the game isn't finished yet.
            */
       }

       func testCatsGame() {
           var board = Game(board: GameBoard()).board
           /*
           o o x
           x o o
           o x x
           */
           
           try! board.place(mark: .o, on: (1, 1))
           try! board.place(mark: .x, on: (1, 2))
           try! board.place(mark: .o, on: (2, 1))
           try! board.place(mark: .x, on: (0, 1))
           try! board.place(mark: .o, on: (0, 2))
           try! board.place(mark: .x, on: (2, 0))
           try! board.place(mark: .o, on: (0, 0))
           try! board.place(mark: .x, on: (2, 2))
           try! board.place(mark: .o, on: (1, 0))
           
           // Is the game full?
           XCTAssertTrue(board.isFull)
           // Did x not win?
           XCTAssertFalse(game(board: board, isWonBy: .x))
           // Did o not win?
           XCTAssertFalse(game(board: board, isWonBy: .o))
           
           /*
            My logic is as follows:
               If the board is full and no one won, we got a cat's game.
            */
       }

}
