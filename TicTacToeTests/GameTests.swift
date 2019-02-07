
import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    //var testGame: Game!
    
    override func setUp() {
        var testGame = Game()
    }

    func testCreateGame() {
        var testGame = Game()
        XCTAssertNotNil(testGame, "There is no valid game")
    }
    
    func testGameBoardEmpty() {
        let board = GameBoard()
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board(x, y))
            }
        }
    }

    func testRestart() {
       let board = GameBoard()
        
        XCTAssertTrue(testGame.activePlayer = .x)
        XCTAssert(testGame.gameIsOver = false)
    }
    
    

}
