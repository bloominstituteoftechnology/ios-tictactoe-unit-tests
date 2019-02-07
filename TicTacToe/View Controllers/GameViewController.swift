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
    
    @IBAction func restartGame(_ sender: Any) {
        board = GameBoard()
        gameState = .active(.x)
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        
        //makeMark(at: coordinate)
        
        //is the game over?
        guard case let GameState.active(player) = gameState else {
            // YES IT IS OVER
            NSLog("Game is over")
            return
        }
        // NO IT IS NOT OVER
        do {
            //make a move
            try board.place(mark: player, on: coordinate)
            
            // did the player win with htis move?
            if game(board: board, isWonBy: player) {
                //YES THEY WON
                gameState = .won(player)
                // ITS A TIE
            } else if board.isFull {
                gameState = .cat
                //NEXT PLAYERS TURN
            } else {
                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                gameState = .active(newPlayer)
            }
            // MOVE IS ILLEGAL
        } catch {
            NSLog("Illegal move")
        }
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
            boardViewController?.board = board
            boardViewController?.delegate = self
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    
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
    
    private var gameGame: Game = Game() {
        didSet {
            updateViews()
        }
    }
}
