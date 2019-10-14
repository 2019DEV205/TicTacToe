//
//  GameEngineTests.swift
//  TicTacToeTests
//
//  Created by 2019_DEV_205 on 14/10/2019.
//  Copyright © 2019 2019_DEV_205. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameEngineTests: XCTestCase {

    let gameEngine = GameEngine()
    
    func testInit() {
        let gameEngine = GameEngine()
        for x in 0...2 {
            for y in 0...2 {
                XCTAssertEqual(board[x][y], Point(coordinate: Coordinate(x, y), mark: Mark.Blank))
            }
        }
    }
    
    func testPotentialMoveValid() {
        let potentialMove = Space(Coorinate(x:0,y:0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
    }
    
    func testPotentialMoveInvalid() {
        let potentialMove = Space(Coorinate(x:0,y:0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        let potentialMove = Space(Coorinate(x:0,y:0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Invalid)
        let potentialMove = Space(Coorinate(x:12,y:1216),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Invalid)
    }
    
    func testHorizontalsWin() {
        var potentialMove = Space(Coorinate(x:0,y:0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(Coorinate(x:1,y:0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(Coorinate(x:2,y:0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Win)
    }
    
    func testVerticalWin() {
        var potentialMove = Space(Coorinate(x:0,y:0),mark:Mark.X)
        gameEngine.process(potentialMove:potentialMove)
        potentialMove = Space(Coorinate(x:0,y:1),mark:Mark.X)
        gameEngine.process(potentialMove:potentialMove)
        potentialMove = Space(Coorinate(x:0,y:2),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Win)
    }
    
    func testDiagonalWin() {
        var potentialMove = Space(Coorinate(x:0,y:0),mark:Mark.X)
        gameEngine.process(potentialMove:potentialMove)
        potentialMove = Space(Coorinate(x:1,y:1),mark:Mark.X)
        gameEngine.process(potentialMove:potentialMove)
        potentialMove = Space(Coorinate(x:2,y:2),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Win)
    }
    
    func testDraw() {
        var potentialMove = Space(Coorinate(x:0,y:0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(Coorinate(x:1,y:0),mark:Mark.O)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(Coorinate(x:2,y:0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Win)
        
        var potentialMove = Space(Coorinate(x:0,y:1),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(Coorinate(x:1,y:1),mark:Mark.O)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(Coorinate(x:2,y:1),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Win)
        
        var potentialMove = Space(Coorinate(x:0,y:2),mark:Mark.O)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(Coorinate(x:1,y:2),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(Coorinate(x:2,y:2),mark:Mark.O)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Draw)
    }
}
