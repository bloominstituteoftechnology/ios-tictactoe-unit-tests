//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
//    private enum GameState {
//        case active(GameBoard.Mark) // Active player
//        case cat
//        case won(GameBoard.Mark) // Winning player
//    }
    
    // MARK: - Properties
    
    var game = Game() {
        didSet {
            updateViews()
            boardViewController.board = game.board
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
    
//    private var gameState = GameState.active(.x) {
//        didSet {
//            updateViews()
//        }
//    }
    
    private var board = GameBoard() {
        didSet {
            updateViews()
            boardViewController.board = board
        }
    }
    
    
    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        
        do {
            try game.makeMark(at: coordinate)
        } catch {
            print("Illegal Move")
        }
        self.updateViews()
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        if let winnerPlayer = game.winningPlayer?.stringValue {
            statusLabel.text = "Player \(winnerPlayer) won"
        } else if let player = game.activePlayer?.stringValue {
            statusLabel.text = "Player \(player) turn"
        } else if game.gameIsOver {
            statusLabel.text = "Cat's Game"
        }
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = segue.destination as? BoardViewController
            
        }
    }
    
    
    
    
}//
