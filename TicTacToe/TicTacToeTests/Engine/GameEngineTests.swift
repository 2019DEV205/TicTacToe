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
                XCTAssertEqual(gameEngine.board[x][y].mark, Mark.Blank)
            }
        }
    }
    
    func testPotentialMoveValid() {
        let potentialMove = Space(coordinate: Coordinate(0,0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
    }
    
    func testPotentialMoveInvalid() {
        var potentialMove = Space(coordinate:Coordinate(0,0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(coordinate:Coordinate(0,0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Taken)
        potentialMove = Space(coordinate:Coordinate(12,1216),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Invalid)
    }
    
    func testHorizontalsWin() {
        var potentialMove = Space(coordinate:Coordinate(0,0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(coordinate:Coordinate(1,0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(coordinate:Coordinate(2,0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Win)
    }
    
    func testVerticalWin() {
        var potentialMove = Space(coordinate:Coordinate(0,0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(coordinate:Coordinate(0,1),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(coordinate:Coordinate(0,2),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Win)
    }
    
    func testDiagonalWin() {
        var potentialMove = Space(coordinate:Coordinate(0,0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(coordinate:Coordinate(1,1),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(coordinate:Coordinate(2,2),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Win)
    }
    
    func testDraw() {
        var potentialMove = Space(coordinate:Coordinate(0,0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(coordinate:Coordinate(1,0),mark:Mark.O)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(coordinate:Coordinate(2,0),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        
        potentialMove = Space(coordinate:Coordinate(0,1),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(coordinate:Coordinate(1,1),mark:Mark.O)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(coordinate:Coordinate(2,1),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        
        potentialMove = Space(coordinate:Coordinate(0,2),mark:Mark.O)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(coordinate:Coordinate(1,2),mark:Mark.X)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Valid)
        potentialMove = Space(coordinate:Coordinate(2,2),mark:Mark.O)
        XCTAssertEqual(gameEngine.process(potentialMove:potentialMove),MoveResult.Draw)
    }
}
