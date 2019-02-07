
import Foundation

struct Game {
    
    //static let shared = Game()
    
    //init(){}
    
    // Restarts the game to a fresh state with an empty board, and player X starting.
    mutating internal func restart() {
        gameIsOver = false
        //board = GameBoard()
        gameState = .active(.x)
        activePlayer = .x
        winningPlayer = nil
    }
    
    // adds a mark for the currently active player at the given coordinate. Updates game state.
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
        guard gameIsOver == false else {
            // YES IT IS OVER
            NSLog("Game is over")
            return
        }
        
        do {
            //make a move
            try board.place(mark: activePlayer, on: coordinate)
            
            // did the player win with this move?
            if game(board: board, isWonBy: activePlayer) {
                //YES THEY WON
                gameState = .won(activePlayer)
                gameIsOver = true
                winningPlayer = activePlayer
                // ITS A TIE
            } else if board.isFull {
                gameState = .cat
                gameIsOver = true
                //NEXT PLAYERS TURN
            } else {
                let nextPlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                gameState = .active(nextPlayer)
                activePlayer = nextPlayer
            }
            // MOVE IS ILLEGAL
        } catch {
            NSLog("Illegal move")
        }
        
    }


// Externally read-only property for the game board. Game itself modifies this as the game progresses.
private(set) var board: GameBoard = GameBoard()

private(set) var gameState: GameState = GameState.active(.x)

// The currently active player, either .x or .o. That is, the player whose turn it is. nil if the game is over.
internal var activePlayer: GameBoard.Mark = .x

// true if the game is over (either won or a cat's game), false if the game is still running.
internal var gameIsOver: Bool = false

// The player that won the game, either .x or .o. nil if the game is still running, or it's a cat's game (no one won).
    internal var winningPlayer: GameBoard.Mark? = nil

enum GameState {
    case active(GameBoard.Mark) // Active player
    case cat
    case won(GameBoard.Mark) // Winning player
    }

}
