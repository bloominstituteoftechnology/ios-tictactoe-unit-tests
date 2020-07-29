//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    // check verticlas for wins
    
    // check each column for all three marks being the same player as the parameter to the function
    
    for x in 0..<3 {
        
        var markCount = 0
        
        for y in 0..<3 {
            if board[(x, y)] == player {
                // they marked the board at this location
                markCount += 1
            }
        }
        
        if markCount == 3 {
            // they won
            return true
        }
    }
    
    // check horizontals for wins
    
    for y in 0..<3 {
        
        var markCount = 0
        
        for x in 0..<3 {
            if board[(x, y)] == player {
                // they marked the board at this location
                markCount += 1
            }
        }
        
        if markCount == 3 {
            // they won
            return true
        }
        
    }
    
    // check diagonals for wins
    
    let leftToRight = [(0,0), (1,1), (2,2)]
    
    var ltrMarkCount = 0
    
    for coordinate in leftToRight {
        if board[coordinate] == player {
            ltrMarkCount += 1
        }
        
        if ltrMarkCount == 3 {
            return true
        }
    }
    
    let rightToLeft = [(2,0), (1,1), (0,2)]
    
    var rtlMarkCount = 0
    for coordinate in rightToLeft {
        if board[coordinate] == player {
            rtlMarkCount += 1
        }
        
        if rtlMarkCount == 3 {
            return true
        }
    }
    
    return false
}

