
import Foundation

struct Game {
    
    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    private var gameState = GameState.active(.x)
    
    // `Game` itself modifies this as the game progresses
    private(set) var board: GameBoard
    
    // The currently active player, either .x, .o, or nil if game over
    internal var activePlayer: GameBoard.Mark?
    
    // True if the game is over (either a win or a cat's game), Fale if still running
    internal var gameIsOver: Bool
    
    // Player that won the game, either .x, .o, or nil if cat's or still running
    internal var winningPlayer: GameBoard.Mark?
    
    // Restarts the game to a fresh state with an empty board, and player X starting
    mutating internal func restart() {
        board = GameBoard()
        gameState = .active(.x)
    }
    
    // Adds a mark for the currently active player at the given coordinate. Updates game state.
    mutating internal func makeMark(at coordinate: Coordinate) throws {

        guard case let GameState.active(player) = gameState else {
            NSLog("Game is over")
            return
        }
        do  {
            try board.place(mark: player, on: coordinate)
            if game(board: board, isWonBy: player) {
                gameState = .won(player)
            } else {
                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                gameState = .active(newPlayer)
            }
        } catch {
            NSLog("Illegal move")
        }
    }
    
}
