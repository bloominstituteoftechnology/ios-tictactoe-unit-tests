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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = "Player \(game.activePlayer!.stringValue)'s turn"
    }
    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try game.makeMark(at: coordinate)
        } catch {
            NSLog("Illegal move")
        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        if game.gameIsOver {
            if let winningPlayer = game.winningPlayer {
                statusLabel.text = "Player \(winningPlayer.stringValue) won!"
            } else {
                statusLabel.text = "Cat's game!"
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
        
    private var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil) {
        didSet {
            boardViewController.board = game.board
            updateViews()
        }
    }
    
}
