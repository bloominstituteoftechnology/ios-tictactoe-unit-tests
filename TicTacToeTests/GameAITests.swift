//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    func testWinCheckingVertical1() {
        var board = GameBoard()
        /*
        x o -
        x o -
        x - -
        */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .x, on: (0, 2))
        
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .o, on: (1, 1))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical2() {
        var board = GameBoard()
        /*
         x o -
         x o -
         - o -
         */
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (1, 2))
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (0, 1))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal1() {
        var board = GameBoard()
        /*
         - o -
         x x x
         o - -
         */
        
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .o, on: (0, 2))
        
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .x, on: (2, 1))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal2() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o o
         */
        
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .o, on: (2, 2))
        
         try! board.place(mark: .x, on: (0, 0))
         try! board.place(mark: .x, on: (1, 1))
        
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingDiagonal1() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o x
         */
        
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .o, on: (2, 1))
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .x, on: (2, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        
    }
    
    func testWinCheckingDiagonal2() {
        var board = GameBoard()
        /*
         x - o
         - o -
         o x -
         */
        
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (0, 2))
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 2))
        
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testIncompleteGame() {
        var board = GameBoard()
        
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .o, on: (2, 2))
        
     
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        
        
        
    }

    func testCatsGame() {
        
        var board = GameBoard()
        
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .o, on: (2, 2))
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        
    }
    
    func testRestart() {
        var game = Game.init(board: GameBoard(), activePlayer: .o, gameIsOver: true, winningPlayer: .o)
        game.restart()
        XCTAssertTrue(game.activePlayer == .x)
    }
    
    func testPlayerHasWon() {
        /*
         x x x
         o o -
         - - -
         */
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        try! game.makeMark(at: (0, 0))
        game.activePlayer = .o
        try! game.makeMark(at: (1,0))
        game.activePlayer = .x
        try! game.makeMark(at: (0,1))
        game.activePlayer = .o
        try! game.makeMark(at: (1,1))
        game.activePlayer = .x
        try! game.makeMark(at: (0,2))
        XCTAssertTrue(game.gameIsOver)
        XCTAssertTrue(game.winningPlayer == .x)
    }
    
//    func testMarking() {
//        let gameboard = GameBoard()
//        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
//        try! game.makeMark(at: (0, 0))
//        
//        XCTAssertTrue(gameboard[(0, 0)] == )
//        
//    }
    
    func testBoardIsFull() {
        /*
         x o x
         o x x
         o x o
         */
        var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        try! game.makeMark(at: (0, 0))
        game.activePlayer = .o
        try! game.makeMark(at: (0, 1))
        game.activePlayer = .x
        try! game.makeMark(at: (0, 2))
        game.activePlayer = .o
        try! game.makeMark(at: (1, 0))
        game.activePlayer = .x
        try! game.makeMark(at: (1, 1))
        game.activePlayer = .x
        try! game.makeMark(at: (1, 2))
        game.activePlayer = .o
        try! game.makeMark(at: (2, 0))
        game.activePlayer = .x
        try! game.makeMark(at: (2, 1))
        game.activePlayer = .o
        try! game.makeMark(at: (2, 2))
        XCTAssertTrue(game.gameIsOver)
        XCTAssertTrue(game.winningPlayer == nil)
    }




}

    
    
    

