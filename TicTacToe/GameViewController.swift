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
            boardViewController?.board = board
            boardViewController?.delegate = self
        }
    }
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
        
        switch gameState {
        case let .active(player):
            statusLabel.text = "Player \(player.stringValue)'s turn"
        case .cat:
            statusLabel.text = "Cat's game!"
        case let .won(player):
            statusLabel.text = "Player \(player.stringValue) won!"
        }
    }
    
    
    
    
}
