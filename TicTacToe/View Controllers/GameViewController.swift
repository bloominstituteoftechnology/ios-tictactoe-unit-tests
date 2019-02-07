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
    
//    private enum GameState {
//        case active(GameBoard.Mark) // Active player
//        case cat
//        case won(GameBoard.Mark) // Winning player
//    }
    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
//        board = GameBoard()
//        gameState = .active(.x)
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        
        do {
            print(coordinate)
          try game.makeMark(at: coordinate)
            
        }catch {
            
            NSLog("Cannot mark at: \(coordinate)")
        }
     
        
//        //is the game over?
//        guard case let GameState.active(player) = gameState else {
//            // YES IT IS OVER
//            NSLog("Game is over")
//            return
//        }
//        // NO IT IS NOT OVER
//        do {
//            //make a move
//            try board.place(mark: player, on: coordinate)
//
//            // did the player win with htis move?
//            if game(board: board, isWonBy: player) {
//                //YES THEY WON
//                gameState = .won(player)
//                // ITS A TIE
//            } else if board.isFull {
//                gameState = .cat
//                //NEXT PLAYERS TURN
//            } else {
//                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
//                gameState = .active(newPlayer)
//            }
//            // MOVE IS ILLEGAL
//        } catch {
//            NSLog("Illegal move")
//        }
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
            boardViewController?.board = board
            boardViewController?.delegate = self
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    
    private var gameState = Game.GameState.active(.x) {
        didSet {
            updateViews()
            print("gameState changed: \(gameState)")
        }
    }
    
    private var board = GameBoard() {
        didSet {
            boardViewController.board = game.board
            updateViews()
        }
    }
    
    private var activePlayer: GameBoard.Mark = .x {
        didSet {
            print("Active player is now: \(game.activePlayer)")
            updateViews()
        }
    }
    
    private var game: Game = Game()  {
        didSet {
            print("game changed: \(String(describing: game))")
            updateViews()
        }
    }
}
