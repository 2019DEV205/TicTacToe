//
//  CoordinateTest.swift
//  TicTacToeTests
//
//  Created by 2019_DEV_205 on 14/10/2019.
//  Copyright © 2019 2019_DEV_205. All rights reserved.
//

import XCTest
@testable import TicTacToe

class CoordinateTests: XCTestCase {
    
    func testAttributes() {
        let coordinate = Coordinate(3,5)
        XCTAssertEqual(coordinate.x, 3)
        XCTAssertEqual(coordinate.y, 5)
    }
    
    func testTagInit() {
        var coordinate = Coordinate(tag: 1)
        XCTAssertEqual(coordinate.x, 0)
        XCTAssertEqual(coordinate.y, 0)
        
        coordinate = Coordinate(tag: 2)
        XCTAssertEqual(coordinate.x, 1)
        XCTAssertEqual(coordinate.y, 0)
        
        coordinate = Coordinate(tag: 3)
        XCTAssertEqual(coordinate.x, 2)
        XCTAssertEqual(coordinate.y, 0)
        
        coordinate = Coordinate(tag: 4)
        XCTAssertEqual(coordinate.x, 0)
        XCTAssertEqual(coordinate.y, 1)
        
        coordinate = Coordinate(tag: 5)
        XCTAssertEqual(coordinate.x, 1)
        XCTAssertEqual(coordinate.y, 1)
        
        coordinate = Coordinate(tag: 6)
        XCTAssertEqual(coordinate.x, 2)
        XCTAssertEqual(coordinate.y, 1)
        
        coordinate = Coordinate(tag: 7)
        XCTAssertEqual(coordinate.x, 0)
        XCTAssertEqual(coordinate.y, 2)
        
        coordinate = Coordinate(tag: 8)
        XCTAssertEqual(coordinate.x, 1)
        XCTAssertEqual(coordinate.y, 2)
        
        coordinate = Coordinate(tag: 9)
        XCTAssertEqual(coordinate.x, 2)
        XCTAssertEqual(coordinate.y, 2)
    }
}
