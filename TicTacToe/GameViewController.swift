//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    override func viewDidLoad() {
        statusLabel.text = "Start the game"
    }
    
    var game2 = Game() {
        didSet {
            boardViewController.board = game2.board // Why??
            updateViews()
            
        }
    }
    
    @IBAction func restartGame(_ sender: Any) {
        game2.restart()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {

        do {
            try game2.makeMark(at: coordinate)
        } catch {
            NSLog("Illegal move")
        }
        
        guard game2.gameIsOver == false else {
            NSLog("Game is over")
            return
        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        if let currentPlayer = game2.activePlayer {
            statusLabel.text = "Player \(currentPlayer.stringValue) 's turn"
        } else if let winner = game2.winnigPlayer {
            statusLabel.text = "Player \(winner.stringValue) won!"
        } else {
            statusLabel.text = "Cat's game"
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
    
    private var board = GameBoard() {
        didSet {
            boardViewController.board = board
        }
    }
}
