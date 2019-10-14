//
//  Player.swift
//  TicTacToe
//
//  Created by 2019_DEV_205 on 14/10/2019.
//  Copyright © 2019 2019_DEV_205. All rights reserved.
//

import UIKit

struct Player{
    var name:String
    var mark:Mark
    
    init(name:String, mark:Mark) {
        self.name = name
        self.mark = mark
    }
}
