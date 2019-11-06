//
//  Game.swift
//  TicTacToe
//
//  Created by macbook on 11/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {

    mutating internal func restart() {
        
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
    }

  private(set) var board: GameBoard

  internal var activePlayer: GameBoard.Mark?
  internal var gameIsOver: Bool
  internal var winningPlayer: GameBoard.Mark?
}
