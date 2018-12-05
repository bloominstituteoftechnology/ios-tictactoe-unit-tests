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
        var counter = 0
        for y in 0...2 {
            if board[(x,y)] == player {
                counter += 1
            }
        }
        if counter == 3 {
            return true
        }
    }
    
    for y in 0...2 {
        var counter = 0
        for x in 0...2 {
            if board[(x,y)] == player {
                counter += 1
            }
        }
        if counter == 3 {
            return true
        }
    }
    
    if board[(0,0)] == player && board [(1,1)] == player && board[(2,2)] == player {
        return true
    } else if board[(0,2)] == player && board [(1,1)] == player && board[(2,0)] == player {
        return true
    }
    
    return false
    
}
