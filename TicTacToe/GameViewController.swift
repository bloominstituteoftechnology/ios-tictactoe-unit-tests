//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
          try game.makeMark(at: coordinate)
        } catch {
            NSLog("Error making Mark: \(error)")
        }

    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        if game.board.isFull && game.gameIsOver && game.winningPlayer == nil {
            statusLabel.text = "Cat's game"
        }
        
        if game.gameIsOver && game.winningPlayer == .o {
            statusLabel.text = "Player O Won!"
            return
        }
        
        if game.gameIsOver && game.winningPlayer == .x {
            statusLabel.text = "Player X Won!"
            return
        }
        
        if !game.board.isFull && !game.gameIsOver && game.activePlayer == .x {
            statusLabel.text = "Player X's turn"
        }
        
        if !game.board.isFull && !game.gameIsOver && game.activePlayer == .o {
            statusLabel.text = "Player O's turn"
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
            boardViewController?.board = game.board
            boardViewController?.delegate = self
        }
    }
    
    var game: Game = Game() {
        didSet {
            updateViews()
            boardViewController.board = game.board
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel!
}
