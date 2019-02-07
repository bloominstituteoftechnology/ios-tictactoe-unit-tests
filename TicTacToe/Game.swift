
import Foundation

struct Game {
    
    // `Game` itself modifies this as the game progresses
    private(set) var board: GameBoard
    
    // The currently active player, either .x, .o, or nil if game over
    internal var activePlayer: GameBoard.Mark? = .x
    
    // True if the game is over (either a win or a cat's game), Fale if still running
    internal var gameIsOver: Bool
    
    // Player that won the game, either .x, .o, or nil if cat's or still running
    internal var winningPlayer: GameBoard.Mark?
    
    // Restarts the game to a fresh state with an empty board, and player X starting
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
    }
    
    // Adds a mark for the currently active player at the given coordinate. Updates game state.
    mutating internal func makeMark(at coordinate: Coordinate) throws {

        guard let player = activePlayer else {
            NSLog("Game is over")
            return
        }
        
        do  {
            try board.place(mark: player, on: coordinate)
            if game(board: board, isWonBy: player) {
                activePlayer = nil
                gameIsOver = true
                winningPlayer = player
            } else {
                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                activePlayer = newPlayer
            }
        } catch {
            NSLog("Illegal move")
        }
    }
    
}
