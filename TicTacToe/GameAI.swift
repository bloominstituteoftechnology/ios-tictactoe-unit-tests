//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    // checking vertical columns
    for x in 0...2 {
        var numberofMarks = 0
        
        for y in 0...2 {
            if board[(x, y)] == player {
                numberofMarks += 1
            }
        }
    
    if numberofMarks == 3 {
        return true
        }
    }
    
    return false
}
