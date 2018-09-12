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
        updateViews()
    }
    
    override func viewDidLoad() {
        updateViews()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try game.makeMark(at: coordinate)
        } catch {
            NSLog("Failed to make mark")
        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        let isOver = game.gameIsOver
        
        if isOver && game.winningPlayer == nil {
            statusLabel.text = "Cat's game!"
        } else if isOver && game.winningPlayer != nil {
            guard let winningPlayer = game.winningPlayer else { return }
            statusLabel.text = "Player \(winningPlayer.stringValue) won!"
        } else {
            statusLabel.text = "Player \(game.activePlayer.stringValue)'s turn"
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
    
    private var game = Game(board: GameBoard(), activePlayer: .x) {
        didSet {
            boardViewController.board = game.board
            updateViews()
        }
    }
}
