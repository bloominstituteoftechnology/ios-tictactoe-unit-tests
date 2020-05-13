//
//  Game.swift
//  TicTacToe
//
//  Created by Hunter Oppel on 5/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    enum GameState {
        case active
        case cat
        case won
    }
    
    private(set) var board: GameBoard
    private(set) var gameState = GameState.active
    
    var activePlayer: GameBoard.Mark? = .x {
        didSet {
            if activePlayer == GameBoard.Mark.o {
                self.minimax(board: board, player: .o)
            }
        }
    }
    var gameIsOver = false
    var winningPlayer: GameBoard.Mark?
    
    mutating func restart() {
        board = GameBoard()
        gameState = .active
        activePlayer = .x
        winningPlayer = nil
        gameIsOver = false
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        guard let player = activePlayer else { return }
        
        try board.place(mark: player, on: coordinate)
        
        if game(board: board, isWonBy: player) {
            winningPlayer = player
            activePlayer = nil
            gameIsOver = true
            gameState = .won
        } else if board.isFull {
            winningPlayer = nil
            activePlayer = nil
            gameIsOver = true
            gameState = .cat
        } else {
            let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
            activePlayer = newPlayer
        }
    }
    
    enum Player: Int {
        case Human = -1
        case Blank = 0
        case Computer = 1
    }
    
    mutating func minimax(board: GameBoard, player: GameBoard.Mark) -> Int {
        var score = -2
        var aiMove: Coordinate = (0, 0)
        
        for x in 0...2 {
            for y in 0...2 {
                if board[(x, y)] == nil {
                    do {
                        var boardWithNewMove = board // Copy board to make it mutable
                        try boardWithNewMove.place(mark: .o, on: (x, y)) // Try the move
                        let scoreForTheMove = -self.minimax(board: boardWithNewMove, player: player == .x ? .x : .o) // Count negative score for oponnent
                        if scoreForTheMove > score {
                            score = scoreForTheMove
                            aiMove = (x, y)
                            print("New best move is (\(x), \(y))")
                        }
                    } catch {
                        NSLog("Illegal move (⚠️ this message shouldn't appear)")
                    }
                }
            }
        }
        
        if player == .o {
            do {
                try self.makeMark(at: aiMove)
            } catch {
                NSLog("AI calculation failed.")
            }
        }
        
        return score
//        for i in 0...9 { // For all moves
//            if let _ = board[()] { // Only possible moves
//                var boardWithNewMove = board // Copy board to make it mutable
//                boardWithNewMove[i] = player // Try the move
//                let scoreForTheMove = -self.minimax(boardWithNewMove, player: self.getOponnentFor(player)) // Count negative score for oponnent
//                if scoreForTheMove > score {
//                    score = scoreForTheMove
//                    move = i
//                } // Picking move that gives oponnent the worst score
//            }
//        }
//        if move == -1 {
//            return 0 // No move - it's a draw
//        }
//        return score
    }
}
