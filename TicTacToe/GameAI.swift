//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    // Code the multiple ways a user can win.
    // - 3 in a row
    // - 3 in a column
    // - 2 diagonals
    
    // Return whether all top positions have the same Mark
    
    let topPositions = [(0, 0), (1, 0), (2, 0)]
    // map -> func which takes an array, iterates through the array, it transforms every item in the array to something else
    // reduce
    // filter
    // Transform top positions to marks
    let topMarks = topPositions.map { topPosition -> GameBoard.Mark? in
        return board[topPosition]
    }
    var playerDidWin = true
    
    for possibleMark in topMarks {
        // there can be no empty squares
        if let mark = possibleMark {
            // There is a mark.
            if mark != player {
                playerDidWin = false
            }
        } else {
            playerDidWin = false
            break
        }
    }
    return playerDidWin
}
