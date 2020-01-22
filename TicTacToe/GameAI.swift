//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    var numberOfMatches = 0
    
    // MARK: - Checking Vertical
    for x in 0 ... 2 {
        numberOfMatches = 0
        for y in 0 ... 2 {
            if board[(x, y)] == player {
                numberOfMatches += 1
            }
        }
        
        if numberOfMatches == 3 {
            return true
        }
    }
    
    // MARK: - Checking Horizontal
    for y in 0 ... 2 {
        numberOfMatches = 0
        for x in 0 ... 2 {
            if board[(x, y)] == player {
                numberOfMatches += 1
            }
        }
        
        if numberOfMatches == 3 {
            return true
        }
    }
    
    // MARK: - Checking Diagonal
    let ltr = [(0, 0), (1, 1), (2, 2)]
    numberOfMatches = 0
    for coord in ltr {
        if board[coord] == player {
            numberOfMatches += 1
        }
    }
    
    if numberOfMatches == 3 {
        return true
    }
    
    
    let rtl = [(2, 0), (1, 1), (0, 2)]
    numberOfMatches = 0
    for coord in rtl {
        if board[coord] == player {
            numberOfMatches += 1
        }
    }
    
    if numberOfMatches == 3 {
        return true
    }
    
    return false
}
