//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    // Check for a horizontal winner
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
    
    // Check for a vertical winner
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
    
    // Check for a diaganal left to right winner
    let ltr: [Coordinate] = [(0,0), (1, 1), (2,2)]
    var numMatches = 0
    for coord in ltr {
        if board[coord] == player {
            numMatches += 1
        }
    }
    if numMatches == 3 { return true }
    
    // Check for a diaganol right to left winner
    let rtl: [Coordinate] = [(2,0), (1, 1), (0,2)]
    numMatches = 0
    for coord in rtl {
        if board[coord] == player {
            numMatches += 1
        }
    }
    if numMatches == 3 { return true }
    
    // No winner yet
    return false
}
