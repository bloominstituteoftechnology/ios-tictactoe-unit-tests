//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        
        do {
            print(coordinate)
            try game.makeMark(at: coordinate)
        }catch {
            NSLog("Illegal move at: \(coordinate)")
        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        switch game.gameState {
        case .active(game.activePlayer):
            statusLabel.text = "Player \(game.activePlayer.stringValue)'s turn"
        case .cat:
            statusLabel.text = "Cat's game!"
        case .won(game.activePlayer):
            statusLabel.text = "Player \((game.winningPlayer?.stringValue)!) won!"
        default:
            print("game state: \(game.gameState)")
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
    
    private var game: Game = Game()  {
        didSet {
            boardViewController.board = game.board
            updateViews()
        }
    }
}
