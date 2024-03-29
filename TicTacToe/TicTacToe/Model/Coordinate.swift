//
//  Coordinate.swift
//  TicTacToe
//
//  Created by 2019_DEV_205 on 14/10/2019.
//  Copyright © 2019 2019_DEV_205. All rights reserved.
//

import UIKit

struct Coordinate {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    //Convenience init for converting linear button view tags to x and y
    init(tag: Int){
        self.x = (tag - 1) % 3
        self.y = (tag - 1) / 3
    }
}
