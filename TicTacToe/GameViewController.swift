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
        super.viewDidLoad()
//        boardViewController.board = game.board
//        game = Game(board: GameBoard())
        updateViews()
        
    }
    
//    private enum GameState {
//        case active(GameBoard.Mark) // Active player
//        case cat
//        case won(GameBoard.Mark) // Winning player
//    }
    // MARK: - Game instance
    private var game = Game(board: GameBoard())
    @IBAction func restartGame(_ sender: Any) {
//        guard var game = game else { return }
//        board = GameBoard()
//        gameState = .active(.x)
        game.restart()
        updateViews()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
//        guard var game = game else { return }
        do {
            try game.makeMark(at: coordinate)
            if game.gameIsOver {
                if let winner = game.winningPlayer {
//                    game.gameState = .won(winner)
                    game.stateChange(to: Game.GameState.won(winner))
                } else {
//                    gameState = .cat
                    game.stateChange(to: Game.GameState.cat)
                }
            }
            updateViews()
        } catch {
            NSLog("Error making a move")
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
//        guard let game = game else { return }
        boardViewController.board = game.board
        
        switch game.gameState {
        case let .active(player):
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
            boardViewController?.board = game.board
            boardViewController?.delegate = self
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    
//    private var gameState: GameState? {
//        didSet {
//            updateViews()
//        }
//    }
    
//    private var board: GameBoard? {
//        didSet {
//            guard let board = board else { return }
//            boardViewController.board = board
//        }
//    }
}
