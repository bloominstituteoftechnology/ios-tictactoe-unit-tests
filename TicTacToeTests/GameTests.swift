//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Dongwoo Pae on 8/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    //write test cases
    /*
    func test .x wins
    func test startplayer .x
     XCTAssertTrue(game(board: board, isWonBy: .o))
    */
    // .x/.o wins horizonal/ vertical
    func testIfxwins() {
        var board = Game.init().board
        /*
         x   o
         x o
         x
         */
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
    }
    
    func testIfowins() {
        var board = Game.init().board
        /*
         o o o
           x
         x
         */
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (2, 0))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        
    }
    
    func testIfxwinsDiagonal() {
        var board = Game.init().board
        /*
         x o o
           x
             x
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
    }
    
    //check if restarting changes active player back to .x
    func testIfrestartingWorks() {
        var game = Game()
        game.restart()
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertFalse(game.activePlayer == .o)
    }
    
    //check if gameOver bool changes to true once board is full
    func testIfGameOver() {
        //var board = Game.init().board
        var gameInstance = Game()
        /*
         x o x
         x o x
         o x o
         */
        //cats game - no winner
        try! gameInstance.makeMark(coordinate: (0, 0)) //.x
        try! gameInstance.makeMark(coordinate: (1, 0))  //.o
        try! gameInstance.makeMark(coordinate: (2, 0)) // .x
        try! gameInstance.makeMark(coordinate: (1, 1)) //.o
        try! gameInstance.makeMark(coordinate: (0, 1)) //.x
        try! gameInstance.makeMark(coordinate: (0, 2)) // .o
        try! gameInstance.makeMark(coordinate: (2, 1)) //.x
        try! gameInstance.makeMark(coordinate: (2, 2)) //.o
        try! gameInstance.makeMark(coordinate: (1, 2)) //.x
        XCTAssertTrue(gameInstance.gameIsOver == true)
    }
    
    //check if first activeplayer is .x and second is .o
    func testPlayers() {
        var gameInstance = Game()
        
        XCTAssertTrue(gameInstance.activePlayer == .x)
        try! gameInstance.makeMark(coordinate: (0, 0)) // should be .x
        XCTAssertTrue(gameInstance.activePlayer == .o)
        try! gameInstance.makeMark(coordinate: (0, 1)) // should be .o
       
    }
}

//refactor gameviewcontroller to call game
