//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    for x in 0...2 {
        var numberOfMarks = 0
        
        for y in 0...2 {
            if board[(x, y)] == player {
                numberOfMarks += 1
            }
        }
        
        if numberOfMarks == 3 {
            return true
        }
    }
    
    for y in 0...2 {
        var numberOfMarks = 0
        
        for x in 0...2 {
            if board[(x, y)] == player {
                numberOfMarks += 1
            }
        }
        
        if numberOfMarks == 3 {
            return true
        }
    }
    
    let leftToRight: [Coordinate] = [(0,0), (1,1), (2,2)]
    
    var numberOfMarks = 0
    
    for coordinate in leftToRight {
        if board[Coordinate] == player {
            numberOfMarks += 1
        }
    }
    
    if numberOfMarks == 3 {
        return true
    }
    
    let rightToLeft: [Coordinate] = [(0,2), (1,1), (2,0)]
    
    numberOfMarks = 0
    
    for coordinate in leftToRight {
        if board[Coordinate] == player {
            numberOfMarks += 1
        }
    }
    
    if numberOfMarks == 3 {
        return true
    }
    
    
    return false
}
