//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    var game = Game() {
        didSet {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.textColor = .black
        updateViews()
    }
//    private enum GameState {
//        case active(GameBoard.Mark) // Active player
//        case cat
//        case won(GameBoard.Mark) // Winning player
//    }
    
    @IBAction func restartGame(_ sender: Any) {
//        board = GameBoard()
//        gameState = .active(.x)
        game.restart()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try game.makeMark(at: coordinate)
        } catch {
            NSLog("Illegal move")
        }
//        guard case let GameState.active(player) = gameState else {
//            NSLog("Game is over")
//            return
//        }
//
//        do {
//            try board.place(mark: player, on: coordinate)
//            if game(board: board, isWonBy: player) {
//                gameState = .won(player)
//            } else if board.isFull {
//                gameState = .cat
//            } else {
//                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
//                gameState = .active(newPlayer)
//            }
//        } catch {
//            NSLog("Illegal move")
//        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        boardViewController.board = game.board
        
        if game.gameIsOver {
            if let player = game.winningPlayer {
                statusLabel.text = "Player \(player.stringValue) won!"
            } else {
                statusLabel.text = "Cat's game!"
            }
        } else if let player = game.activePlayer {
            statusLabel.text = "Player \(player.stringValue)'s turn"
        }
        
//        switch gameState {
//        case let .active(player):
//            statusLabel.text = "Player \(player.stringValue)'s turn"
//        case .cat:
//            statusLabel.text = "Cat's game!"
//        case let .won(player):
//            statusLabel.text = "Player \(player.stringValue) won!"
//        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = segue.destination as? BoardViewController
        }
    }
    
//    private var gameState = GameState.active(.x) {
//        didSet {
//            updateViews()
//        }
//    }
//
//    private var board = GameBoard() {
//        didSet {
//            boardViewController.board = board
//        }
//    }
}
