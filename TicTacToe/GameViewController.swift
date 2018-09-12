//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

enum GameState {
	case active(GameBoard.Mark) // Active player
	case cat
	case won(GameBoard.Mark) // Winning player
}


func checkForGameOver(_ board:GameBoard, current:GameBoard.Mark) -> GameState
{
	if gameWon(board: board, by: .x) {
		return .won(.x)
	} else if gameWon(board: board, by: .o){
		return .won(.o)
	} else if board.isFull {
		return .cat
	}

	return GameState.active(getEnemy(current))
}

func getEnemy(_ player:GameBoard.Mark) -> GameBoard.Mark
{
	if player == .x {
		return .o
	} else {
		return .x
	}
}


class GameViewController: UIViewController, BoardViewControllerDelegate
{

    @IBAction func restartGame(_ sender: Any) {
        board = GameBoard()
        gameState = .active(.x)
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        guard case let GameState.active(player) = gameState else {
            NSLog("Game is over")
            return
        }
        
        do {
            try board.place(mark: player, on: coordinate)
			gameState = checkForGameOver(board, current:player)
			if gameState ==

				let pos = nextMove(board, for: GameBoard.Mark.o)
				try board.place(mark: GameBoard.Mark.o, at: pos)
				gameState = checkForGameOver(board, current:getEnemy(player))

        } catch {
            NSLog("Illegal move")
        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        switch gameState {
        case let .active(player):
            statusLabel.text = "Player \(player.stringValue)'s turn"
        case .cat:
            statusLabel.text = "Cat's game!"
        case let .won(player):
            statusLabel.text = "Player \(player.stringValue) won!"
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = segue.destination as! BoardViewController
        }
    }
    
    private var boardViewController: BoardViewController! {
        willSet {
            boardViewController?.delegate = nil
        }
        didSet {
            boardViewController?.board = board
            boardViewController?.delegate = self
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    
    private var gameState = GameState.active(.x) {
        didSet {
            updateViews()
        }
    }
    
    private var board = GameBoard() {
        didSet {
            boardViewController.board = board
        }
    }
}
