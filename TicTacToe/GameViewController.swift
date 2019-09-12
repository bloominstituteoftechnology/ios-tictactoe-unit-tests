//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
	
	//MARK: - IBOutlets
	
	@IBOutlet weak var statusLabel: UILabel!
	@IBOutlet weak var undoBtn: UIButton!
	
	//MARK: - Properties
	
	private enum GameState {
		case active(GameBoard.Mark) // Active player
		case cat
		case won(GameBoard.Mark) // Winning player
	}
	
	var gamePlay = Game(board: GameBoard())
	
	private var boardViewController: BoardViewController! {
		willSet {
			boardViewController?.delegate = nil
		}
		didSet {
			boardViewController.board = gamePlay.board
			boardViewController.delegate = self
		}
	}
	private var gameState = GameState.active(.x) {
		didSet {
			updateViews()
		}
	}
	
	//MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		gameState = .active(.x)
	}
	
	// MARK: - Navigation
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "EmbedBoard" {
			boardViewController = segue.destination as? BoardViewController
		}
	}
	
	//MARK: - IBActions
	
	@IBAction func restartGame(_ sender: Any) {
		gamePlay.restart()
		boardViewController.board = gamePlay.board
		gameState = GameState.active(gamePlay.activePlayer ?? .x)
		updateViews()
	}
	
	@IBAction func undoBtnTapped(_ sender: Any) {
		do {
			try gamePlay.removeMark()
			boardViewController.updateButtons()
		} catch {
			NSLog("Could not undo")
		}
	}
	
	//MARK: - Helpers
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        switch gameState {
        case let .active(player):
            statusLabel.text = "Player \(player.stringValue)'s turn"
			undoBtn.isEnabled = true
        case .cat:
            statusLabel.text = "Cat's game!"
        case let .won(player):
            statusLabel.text = "Player \(player.stringValue) won!"
			undoBtn.isEnabled = false
        }
    }
}

// MARK: - BoardViewControllerDelegate

extension GameViewController: BoardViewControllerDelegate {
	
	func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
		guard case let GameState.active(player) = gameState else {
			NSLog("Game is over")
			return
		}
		
		do {
			try gamePlay.placeMark(at: coordinate)
			if let player = gamePlay.activePlayer, game(board: gamePlay.board, isWonBy: player) {
				gameState = .won(player)
				gamePlay.winningPlayer = player
			} else if gamePlay.board.isFull {
				gameState = .cat
			} else {
				let nextPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
				gameState = .active(nextPlayer)
				gamePlay.activePlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
			}
		} catch {
			NSLog("Illegal move")
		}
	}
}
