//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    @IBOutlet weak var undoButton: UIButton!
    
    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
        boardViewController.board = game.board
        undoButton.isEnabled = false
    }
    
    @IBAction func undoTapped(_ sender: UIButton) {
        game.undoLastMove()
        boardViewController.board = game.board
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateViews()
        undoButton.isEnabled = false
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try game.makeMark(at: coordinate)
            if let winner = game.getWinningPlayer() {
                gameState = .won(winner)
            } else {
                gameState = .cat
            }
            undoButton.isEnabled = true
        } catch {
            NSLog("Illegal move")
        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        if let winner = game.getWinningPlayer() {
            statusLabel.text = "Player \(winner.stringValue) won!"
        } else if !game.isGameOver(), let player = game.getCurrentPlayer() {
            statusLabel.text = "Player \(player.stringValue)'s turn"
        } else {
            statusLabel.text = "Cat's game!"
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = segue.destination as? BoardViewController
        }
    }
    
    private var boardViewController: BoardViewController! {
        willSet {
            boardViewController?.delegate = nil
        }
        didSet {
            boardViewController?.board = game.board
            boardViewController?.delegate = self
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    
    private var gameState = GameState.active(.x) {
        didSet {
            updateViews()
        }
    }
    
    private var game = Game(board: GameBoard(), gameIsOver: false) {
        didSet {
            boardViewController.board = game.board
        }
    }
}
