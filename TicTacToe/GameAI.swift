//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
     return verticalWinCondition(board: board, player: player)
}

func verticalWinCondition(board: GameBoard, player: GameBoard.Mark) -> Bool {
    
    for x in 0 ..< 3 {
        var count = 0
        for y in 0 ..< 3 {
            if board[(x, y)] == player {
                count += 1
            }
        }
        if count == 3 {
            return true
        }
    }
    return false
}
