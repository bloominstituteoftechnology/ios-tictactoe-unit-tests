//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    //checks first column
    //    if board[(0, 0)] == player &&
    //        board[(0, 1)] == player &&
    //        board[(0, 2)] == player {
    //        return true
    //    }
    
    //checks all column, verticals
    for x in 0..<3 {
        var numMarks = 0
        for y in 0..<3 {
            //check what player
            if board[(x, y)] == player {
                numMarks += 1
            }
        }
        if numMarks == 3 {
            return true
        }
    }
    //testing horizontals
    for y in 0..<3 {
        var numMarks = 0
        
        for x in 0..<3 {
            if board[(x, y)] == player {
                numMarks += 1
            }
        }
        if numMarks == 3 {
            return true
        }
        //testing diagnols
        //backwards slash: (0, 0)(1, 1), (2, 2)
        //forward slash: (0, 2), (1, 1) (2, 2)
        //non winning cases
        
    }
    return false

}
