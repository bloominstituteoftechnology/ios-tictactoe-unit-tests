//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
    }
    
    @IBAction func undo(_ sender: Any) {
        game.undo()
        updateViews()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try game.makeMark(at: coordinate)
            updateViews()
        } catch {
            NSLog("Illegal move")
        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        if game.board.isFull {
            statusLabel.text = "Cat's game!"
        } else if game.gameIsOver && game.winningPlayer != nil {
            if let winningPlayer = game.winningPlayer {
                statusLabel.text = "Player \(winningPlayer.stringValue) won!"
            }
        } else {
            if let activePlayer = game.activePlayer {
                statusLabel.text = "Player \(activePlayer.stringValue)'s turn"
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = segue.destination as! BoardViewController
        }
    }
    
    private var game = Game() {
        didSet {
            boardViewController.board = game.board
            updateViews()
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
}
