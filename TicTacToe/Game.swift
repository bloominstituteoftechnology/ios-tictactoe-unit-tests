//
//  Game.swift
//  TicTacToe
//
//  Created by Hector Steven on 6/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
	mutating  func restart() {
		board = GameBoard()
		activePlayer = .x
		gameIsOver = false
		winningPlayer = nil
		gameState = GameState.active(.x)
	}
	
	enum GameState: Equatable {
		case active(GameBoard.Mark) // Active player
		case cat
		case won(GameBoard.Mark) // Winning player
	}
	
	mutating  func makeMark(at coordinate: Coordinate) throws {
		
		try board.place(mark: activePlayer, on: coordinate)
		
		if game(board: board, isWonBy: activePlayer) {
			gameState = .won(activePlayer)
			
		} else if board.isFull {
			gameState = .cat
			
		} else {
			let newPlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
			gameState = .active(newPlayer)
			activePlayer = newPlayer
		}
	}
	
	init(board: GameBoard, activePlayer: GameBoard.Mark = .x, gameIsOver: Bool = false, winningPlayer: GameBoard.Mark? = nil, gameState: GameState = GameState.active(.x)) {
		self.board = board
		self.activePlayer = activePlayer
		self.gameIsOver = gameIsOver
		self.winningPlayer = winningPlayer
		self.gameState = gameState
	}
	
	private(set) var board: GameBoard
	internal var activePlayer: GameBoard.Mark
	internal var gameIsOver: Bool
	internal var winningPlayer: GameBoard.Mark?
	var gameState: GameState

}


// Helpers

extension Game {
	var getGameState: GameState{
		switch gameState {
		case let .active(player):
			print("Player \(player.stringValue)'s turn")
		case .cat:
			print("Cat's game!")
		case let .won(player):
			print("Player \(player.stringValue) won!")
		}
		return gameState
	}
	
	func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
		// Check verticals
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
		
		// Check horizontals
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
		
		// Check diagonals
		let ltr: [Coordinate] = [(0,0), (1, 1), (2,2)]
		var numMatches = 0
		for coord in ltr {
			if board[coord] == player {
				numMatches += 1
			}
		}
		if numMatches == 3 { return true }
		
		let rtl: [Coordinate] = [(2,0), (1, 1), (0,2)]
		numMatches = 0
		for coord in rtl {
			if board[coord] == player {
				numMatches += 1
			}
		}
		if numMatches == 3 { return true }
		
		return false
	}

	
}
