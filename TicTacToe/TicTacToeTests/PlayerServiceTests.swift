//
//  PlayerServiceTests.swift
//  TicTacToeTests
//
//  Created by 2019_DEV_205 on 14/10/2019.
//  Copyright © 2019 2019_DEV_205. All rights reserved.
//

import XCTest
@testable import TicTacToe

class PlayerServiceTests: XCTestCase {
    
    private var playerService:PlayerService!
    
    override func setUp() {
        let playerX = Player(name:"Player1",mark:Mark.X)
        let playerO = Player(name:"Player2",mark:Mark.O)
        playerService = PlayerService(playerX:playerX,playerO:playerO)
    }

    func testAttributes() {
        XCTAssertEqual(playerService.playerX.name, "Player1")
        XCTAssertEqual(playerService.playerX.mark, Mark.X)
        XCTAssertEqual(playerService.playerO.name, "Player2")
        XCTAssertEqual(playerService.playerO.mark, Mark.O)
    }
    
    func testSwitchPlayer() {
        XCTAssertEqual(playerService.currentPlayer.name, "Player1")
        playerService.switchCurrentPlayer()
        XCTAssertEqual(playerService.currentPlayer.name, "Player2")
        playerService.switchCurrentPlayer()
        XCTAssertEqual(playerService.currentPlayer.name, "Player1")
    }
}
