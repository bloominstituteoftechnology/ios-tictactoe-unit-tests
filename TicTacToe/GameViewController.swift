//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    private var gameModel = Game() {
        didSet {
           updateViews()
        }
    }
    
    @IBAction func restartGame(_ sender: Any) {
        self.gameModel.restart()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try self.gameModel.makeMark(at: coordinate)
        } catch {
            print("Error in marking the board.")
        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        if let activePlayer = self.gameModel.activePlayer {
            statusLabel.text = "Player \(activePlayer.stringValue)'s turn"
        } else if let winningPlayer = self.gameModel.winningPlayer {
            statusLabel.text = "Player \(winningPlayer.stringValue) won!"
        } else if self.gameModel.gameIsOver {
            statusLabel.text = "Cat's game!"
        }
        
        // assign the board to a new board
        self.boardViewController.board = self.gameModel.board
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
            boardViewController?.board = self.gameModel.board
            boardViewController?.delegate = self
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel!
}
