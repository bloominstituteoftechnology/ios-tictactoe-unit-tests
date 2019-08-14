//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    // Check the vertical win conditions
    for x in 0 ..< 3 {
        var numMarks = 0
        for y in 0 ..< 3 {
            if board[(x, y)] == player {
                numMarks += 1
            }
        }
        if numMarks == 3 {
            return true
        }
    }
    
    // TODO: Check the horizontal
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
    
    // TODO: Check the diagonals
    let lCoordinates: [Coordinate] = [(0,0), (1, 1), (2,2)]
    var matches = 0
    for coord in lCoordinates {
        if board[coord] == player {
            matches += 1
        }
    }
    if matches == 3 { return true }
    
    let rCoordinates: [Coordinate] = [(2,0), (1, 1), (0,2)]
    matches = 0
    for coord in rCoordinates {
        if board[coord] == player {
            matches += 1
        }
    }
    if matches == 3 { return true }
    

    return false
}
