//
//  Game.swift
//  TicTacToe
//
//  Created by Cameron Collins on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    public enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    //MARK: - Properties
    private(set) var board: GameBoard = GameBoard()
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    public var gameState: GameState
    
    
    //MARK: - Initializer
    init(gameState: GameState = .active(.x)) {
        self.gameIsOver = false 
        self.gameState = gameState
        self.activePlayer = .x
    }
    
    
    //MARK: - Methods
    mutating internal func restart() {
        board = GameBoard()
        gameState = .active(.x)
        activePlayer = .x
    }
    
    //Makes a Mark on the game board
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
        //Did Somebody Win?
        if gameIsOver == true {
            NSLog("Game is over")
            return
        }
        
        guard let activePlayer = activePlayer else {
            print("Active Player is nil")
            return
        }
        
        do {
            try board.place(mark: activePlayer, on: coordinate)
            print("Mark Set")
            if game(board: board, isWonBy: activePlayer) {
                gameState = .won(activePlayer)
                winningPlayer = activePlayer
            } else if board.isFull {
                gameState = .cat
            } else {
                let newPlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                gameState = .active(newPlayer)
            }
            
            //Changing Active Player
            if self.activePlayer == .x {
                self.activePlayer = .o
            } else {
                self.activePlayer = .x
            }
        } catch {
            NSLog("Illegal move")
        }
        
    }
}
