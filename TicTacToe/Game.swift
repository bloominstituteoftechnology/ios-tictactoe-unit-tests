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
		guard let activePlayer = activePlayer, gameIsOver == false else { return }
		
		try board.place(mark: activePlayer, on: coordinate)
		
		if game(board: board, isWonBy: activePlayer) {
			gameState = .won(activePlayer)
		} else if board.isFull {
			gameState = .cat
		} else {
			let newPlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
			gameState = .active(newPlayer)
		}
	}
	
	init(board: GameBoard, activePlayer: GameBoard.Mark = .x, gameIsOver: Bool = false, winningPlayer: GameBoard.Mark? = nil) {
		self.board = board
		self.activePlayer = activePlayer
		self.gameIsOver = gameIsOver
		self.winningPlayer = winningPlayer
	}
	
	private(set) var board: GameBoard
	internal var activePlayer: GameBoard.Mark?
	internal var gameIsOver: Bool
	internal var winningPlayer: GameBoard.Mark?
	private (set) var gameState: GameState?

}


// Helpers

extension Game {
	 func getGameState() -> GameState? {
		guard let gameState = gameState else { return nil}
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
	
	
	
}
