//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    @IBOutlet weak var statusLabel: UILabel!
    
    var game = Game() {
        didSet {
            updateViews()
            boardViewController.game = game
        }
    }
    
    private var gameState = GameState.active(.x) {
        didSet {
            updateViews()
        }
    }
    
    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusLabel.text = "Hi!"
        updateViews()
    }
    
    @IBAction func restartGame(_ sender: Any) {
        game = Game()
//        gameState = .active(.x)
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try game.makeMark(at: coordinate)
            updateViews()
        } catch {
            NSLog("Error making a mark on the board: \(error)")
        }
    }
    
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        switch game.gameState {
        case let .active(player):
            print("Player \(player.stringValue)'s turn")
            statusLabel.text = "Player \(player.stringValue)'s turn"
        case .cat:
            statusLabel.text = "Cat's game!"
        case let .won(player):
            statusLabel.text = "Player \(player.stringValue) won!"
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
            boardViewController.game = game
            boardViewController?.delegate = self
        }
    }
    
    
}
