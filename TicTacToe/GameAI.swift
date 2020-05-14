//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    //checking vertical column 0
    var numberOfMarks = 0
    
    for y in 0...2 {
        if board[(0,y)] == player {
            numberOfMarks += 1
        }
    }
    
    if numberOfMarks == 3 {
        return true
    }
    
    numberOfMarks = 0
    
    for y in 0...2 {
        if board[(1,y)] == player {
            numberOfMarks += 1
        }
        if numberOfMarks == 3 {
            return true
        }
    }
    
    return false
}
