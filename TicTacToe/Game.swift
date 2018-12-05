//
//  Game.swift
//  TicTacToe
//
//  Created by Yvette Zhukovsky on 12/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation


struct Game {
    
    
    init() {
        self.board = GameBoard()
        self.activePlayer = .x
        self.gameIsOver = false
        self.winningPlayer = nil
    }
    
    
    
    mutating internal func restart(){
        
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
    }
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard var activePlayer = activePlayer else {return}
        try! board.place(mark: activePlayer, on: coordinate)
        if game(board: board, isWonBy: activePlayer){
            winningPlayer = activePlayer
            gameIsOver = true
        } else if board.isFull {
            gameIsOver = true
            
        } else {
            
            if activePlayer == .x {
                activePlayer = .o
            } else {
                activePlayer = .x
            }
            
        }
        
    }
    
    
    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool 
    internal var winningPlayer: GameBoard.Mark?
}


