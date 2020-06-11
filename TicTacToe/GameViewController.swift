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
    
    
    //MARK: - Properties -
    var currentGame: Game = Game()
    @IBOutlet weak var statusLabel: UILabel!
    
    private var boardViewController: BoardViewController! {
        willSet {
            boardViewController?.delegate = nil
        }
        didSet {
            boardViewController?.board = currentGame.board
            boardViewController?.delegate = self
        }
    }
    private var gameState = GameState.active(.x) {
        didSet {
            updateViews()
        }
    }
    
    
    // MARK: - BoardViewControllerDelegate -
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try currentGame.makeMark(at: coordinate)
        } catch {
            NSLog("Invalid Move.")
        }
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = (segue.destination as! BoardViewController)
        }
    }
    
    
    //MARK: - Actions -
    @IBAction func restartGame(_ sender: Any) {
        currentGame.restart()
    }
    
    
    // MARK: - Private
    private func updateViews() {
        guard isViewLoaded else { return }
        
        switch currentGame.activePlayer {
        case .x:
            statusLabel.text = "X's Turn."
        case .o:
            statusLabel.text = "O's Turn."
        default:
            switch currentGame.winningPlayer {
            case .x:
                statusLabel.text = "X wins! Play again?"
            case .o:
                statusLabel.text = "Y wins! Play again?"
            default:
                switch currentGame.gameIsOver {
                case true:
                    statusLabel.text = "Game to the Cat. Play again?"
                case false:
                    restartGame(self)
                }
            }
        }
    }
    
    
    
    
}
