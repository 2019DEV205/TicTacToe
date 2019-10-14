//
//  ImageHelper.swift
//  TicTacToe
//
//  Created by 2019_DEV_205 on 14/10/2019.
//  Copyright © 2019 2019_DEV_205. All rights reserved.
//

import UIKit

class ImageHelper {
    
    static func getImageFor(mark:Mark) -> UIImage?
    {
        if mark == Mark.X {
            return UIImage.init(named: "ticTacToe_x")
        }
        else if mark == Mark.O {
            return UIImage.init(named: "ticTacToe_o")
        }
        return nil
    }
}
