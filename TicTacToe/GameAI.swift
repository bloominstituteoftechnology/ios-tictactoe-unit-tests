//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    // Check vertical wins
    
    for x in 0..<3 {
        var markCount = 0
        
        for y in 0..<3 {
            if board[(x, y)] == player {
                markCount += 1
            }
        }
        
        if markCount == 3 {
            return true
        }
    }
    
    // Check horizontal wins
    for y in 0..<3 {
        var markCount = 0
        
        for x in 0..<3 {
            if board[(x, y)] == player {
                markCount += 1
            }
        }
        
        if markCount == 3 {
            return true
        }
    }
    
    
    // Check diagonal wins
    
    let leftToRight: [Coordinate] = [(0, 0), (1, 1), (2, 2)]

    var markCount = 0
    for coordinate in leftToRight {
        if board[coordinate] == player {
            markCount += 1
        }
    }
    
    if markCount == 3 {
        return true
    }
    
    
    let rightToLeft: [Coordinate] = [(2, 0), (1, 1), (0, 2)]
    
    var markCount2 = 0
    for coordinate in rightToLeft {
        if board[coordinate] == player {
            markCount2 += 1
        }
    }
    
    if markCount2 == 3 {
        return true
    }
    
    return false
    
}
