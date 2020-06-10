//
//  Game.swift
//  TicTacToe
//
//  Created by Cody Morley on 6/10/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

// THIS CONTROLLER WILL TAKE THE FUCTIONALITY OF RUNNING THE GAME OUT OF THE VCs
///TODO:   ! done  **in progress
///1. Give all properties correct values **
///2. fill functions
///3. test this controller
///4. call in the vcs


import Foundation

struct Game {
    //MARK: - Properties -
    private(set) var board: GameBoard
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?

    
    //MARK: - Actions -
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = GameBoard.Mark.x
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
    }

  
}
