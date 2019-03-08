//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    // MARK: - Properties
    
    private var game = Game() {
        didSet {
            updateViews()
            boardViewController.board = game.board
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
    
    private var boardViewController: BoardViewController! {
        willSet {
            boardViewController?.delegate = nil
        }
        didSet {
            boardViewController?.board = game.board //board
            boardViewController?.delegate = self
        }
    }
    
    //    private enum GameState {
    //        case active(GameBoard.Mark) // Active player
    //        case cat
    //        case won(GameBoard.Mark) // Winning player
    //    }
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func restartGame(_ sender: Any) {
        //        board = GameBoard()
        //        gameState = .active(.x)
        
        game.restart()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
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
        
        guard game.gameIsOver == false else {
            NSLog("Game is over")
            return
        }
        
        do {
            try game.makeMark(at: coordinate)
        } catch {
            NSLog("Illegal move")
        }
        
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        //        switch gameState {
        //        case let .active(player):
        //            statusLabel.text = "Player \(player.stringValue)'s turn"
        //        case .cat:
        //            statusLabel.text = "Cat's game!"
        //        case let .won(player):
        //            statusLabel.text = "Player \(player.stringValue) won!"
        //        }
        
        if game.gameIsOver {
            if let winningPlayer = game.winningPlayer {
                statusLabel.text = "Player \(winningPlayer.stringValue) won!"
            } else {
                statusLabel.text = "Cat's game!"
            }
        } else {
            statusLabel.text = "Player \(game.activePlayer!.stringValue)'s turn"
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = segue.destination as! BoardViewController
        }
    }
    
    
}
