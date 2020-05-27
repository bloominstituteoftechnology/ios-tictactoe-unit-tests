//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    // checking vertical column 0
    var numberofMarks = 0
    
    for y in 0...2 {
        if board[(0, y)] == player {
            numberofMarks += 1
        }
    }
    
    if numberofMarks == 3 {
        return true
    }
    
    // checking vertical column 1
    numberofMarks = 0
    
    for y in 0...2 {
        if board[(1, y)] == player {
            numberofMarks += 1
        }
    }
    
    if numberofMarks == 3 {
        return true
    }
    
    return false
}
