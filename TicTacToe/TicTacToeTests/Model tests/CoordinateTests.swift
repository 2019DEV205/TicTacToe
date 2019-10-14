//
//  CoordinateTest.swift
//  TicTacToeTests
//
//  Created by 2019_DEV_205 on 14/10/2019.
//  Copyright © 2019 2019_DEV_205. All rights reserved.
//

import XCTest

class CoordinateTests: XCTestCase {

    func testAttributes() {
        let coordinate = Coordinate(x:3,y:5)
        XCTAssertEqual(coordinate.x, 3)
        XCTAssertEqual(coordinate.y, 5)
    }
}
