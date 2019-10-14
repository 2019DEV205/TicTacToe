//
//  Space.swift
//  TicTacToe
//
//  Created by 2019_DEV_205 on 14/10/2019.
//  Copyright © 2019 2019_DEV_205. All rights reserved.
//

import UIKit

struct Space{
    var coordinate: Coordinate
    var mark: Mark
    
    init(coordinate:Coordinate, mark:Mark) {
        self.coordinate = coordinate
        self.mark = mark
    }
}
