//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    // checking vertical columns
    for x in 0...2 {
        var numberofMarks = 0
        
        for y in 0...2 {
            if board[(x, y)] == player {
                numberofMarks += 1
            }
        }
    
    if numberofMarks == 3 {
        return true
        }
    }
    
    // checking horizontal columns
     for y in 0...2 {
         var numberofMarks = 0
         
         for x in 0...2 {
             if board[(x, y)] == player {
                 numberofMarks += 1
             }
         }
     
     if numberofMarks == 3 {
         return true
        
         }
     }
    
    // checking diagonalA columns
    let leftToRight: [Coordinate] = [(0, 0), (1,1), (2,2)]
    var numberOfMarks = 0
    
    for coordinate in leftToRight {
        if board[coordinate] == player {
            numberOfMarks += 1
        }
    }
    
    if numberOfMarks == 3 {
        return true
    }
    
    // checking diagonalB columns
      let rightToLeft: [Coordinate] = [(2, 0), (1,1), (0,2)]
      numberOfMarks = 0
      
      for coordinate in rightToLeft {
          if board[coordinate] == player {
              numberOfMarks += 1
          }
      }
      
      if numberOfMarks == 3 {
          return true
      }
    
    return false
}
