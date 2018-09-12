//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    // Check verticals
    for x in 0..<3 {
        var numMarks = 0
        for y in 0..<3 {
            if board[(x, y)] == player {
                numMarks += 1
            }
        }
        if numMarks == 3 {
            return true
        }
    }
    
    // Check horizontals
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
    }
    
    // Check diagonals
    let leftToRight: [Coordinate] = [(0,0), (1, 1), (2,2)]
    var numMatches = 0
    for coordinate in leftToRight {
        if board[coordinate] == player {
            numMatches += 1
        }
    }
    if numMatches == 3 { return true }

    let rightToLeft: [Coordinate] = [(2,0), (1, 1), (0,2)]
    numMatches = 0
    for coordinate in rightToLeft {
        if board[coordinate] == player {
            numMatches += 1
        }
    }
    if numMatches == 3 { return true }
    
    return false
}
