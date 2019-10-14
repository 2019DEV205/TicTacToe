//
//  PlayerTest.swift
//  TicTacToeTests
//
//  Created by 2019_DEV_205 on 14/10/2019.
//  Copyright © 2019 2019_DEV_205. All rights reserved.
//

import XCTest

class PlayerTests: XCTestCase {

    func testAttributes() {
        let player = Player(name:"PlayerName",mark:Mark.X)
        XCTAssertEqual(player.name, "PlayerName")
        XCTAssertEqual(player.mark, Mark.X)
    }
}
