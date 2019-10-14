//
//  SpaceTest.swift
//  TicTacToeTests
//
//  Created by 2019_DEV_205 on 14/10/2019.
//  Copyright © 2019 2019_DEV_205. All rights reserved.
//

import XCTest

class SpaceTests: XCTestCase {

    func testAttributes() {
        let coordinate = Coordinate(x:3,y:5)
        let mark = Mark.O
        let space = Space(coordinate:coordinate, mark:mark)
        XCTAssertEqual(space.coordinate.x, 3)
        XCTAssertEqual(space.coordinate.y, 5)
        XCTAssertEqual(space.mark, Mark.O)
    }
}