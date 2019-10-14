//
//  PlayerService.swift
//  TicTacToe
//
//  Created by 2019_DEV_205 on 14/10/2019.
//  Copyright © 2019 2019_DEV_205. All rights reserved.
//

import UIKit

class PlayerService {
    var playerX:Player
    var playerO:Player
    var currentPlayer:Player!
    
    init(playerX:Player,playerO:Player){
        self.playerX = playerX
        self.playerO = playerO
        currentPlayer = playerX
    }
    
     func switchCurrentPlayer(){
        if let player = currentPlayer
        {
            if player.name == playerO.name {
                currentPlayer = playerX
            }
            else {
                currentPlayer = playerO
            }
        }
    }
}
