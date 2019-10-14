//
//  ImageHelperTests.swift
//  TicTacToeTests
//
//  Created by 2019_DEV_205 on 14/10/2019.
//  Copyright © 2019 2019_DEV_205. All rights reserved.
//

import XCTest
@testable import TicTacToe

class ImageHelperTests: XCTestCase {
    
    func testGetImageForMark() {
        XCTAssertEqual(ImageHelper.getImageFor(mark:Mark.X), UIImage.init(named: "ticTacToe_x"))
        XCTAssertEqual(ImageHelper.getImageFor(mark:Mark.O), UIImage.init(named: "ticTacToe_o"))
        XCTAssertEqual(ImageHelper.getImageFor(mark:Mark.Blank), nil)
    }
}
