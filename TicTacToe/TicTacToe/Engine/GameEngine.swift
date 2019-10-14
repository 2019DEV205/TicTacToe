//
//  GameController.swift
//  TicTacToe
//
//  Created by 2019_DEV_205 on 14/10/2019.
//  Copyright © 2019 2019_DEV_205. All rights reserved.
//

import UIKit

class GameEngine: NSObject {
    
    var isGameFinished = false
    var board = [[Space]](repeating: [Space](repeating: Space(coordinate: Coordinate(0,0), mark: Mark.Blank), count: 3), count: 3)
    
    override init(){
        //fill coordinates with blank marks
        for x in 0...2 {
            for y in 0...2 {
                board[x][y] = Space(coordinate: Coordinate(x, y), mark: Mark.Blank)
            }
        }
    }
    
    func process(potentialMove:Space) -> MoveResult{
        if !((0 ... 2 ~= potentialMove.coordinate.x)&&(0 ... 2 ~= potentialMove.coordinate.y))
        {
            return MoveResult.Invalid
        }
        
        if isMoveValid(potentialMove)
        {
            board[potentialMove.coordinate.x][potentialMove.coordinate.y].mark = potentialMove.mark
            return checkForMoveOutcome()
        }
        else
        {
            return MoveResult.Taken
        }
    }
    
    private func isMoveValid(_ move:Space) -> Bool{
        return board[move.coordinate.x][move.coordinate.y].mark == Mark.Blank
    }
    
    private func checkForMoveOutcome() -> MoveResult{
        if checkDiagonalsForWin() || checkHorizontalsForWin() || checkVerticalsForWin(){
            isGameFinished = true
            return MoveResult.Win
        }
        else if checkIsBoardFull()
        {
            isGameFinished = true
            return MoveResult.Draw
        }
        else {
            return MoveResult.Valid
        }
    }
    
    private func checkIsBoardFull() -> Bool{
        for x in 0...2 {
            for y in 0...2 {
                if board[x][y].mark == Mark.Blank{
                    return false
                }
            }
        }
        return true
    }
    
    private func checkVerticalsForWin() -> Bool{
        for x in 0...2 {
            if (board[x].filter{ $0.mark == Mark.X}.count == 3)
                || (board[x].filter{ $0.mark == Mark.O}.count == 3){
                return true
            }
        }
        return false
    }
    
    private func checkHorizontalsForWin() -> Bool{
        var countX = 0
        var countO = 0
        for y in 0...2 {
            countX = 0
            countO = 0
            for x in 0...2 {
                if board[x][y].mark == Mark.X{
                    countX+=1
                }
                else if board[x][y].mark == Mark.O{
                    countO+=1
                }
            }
            if (countX == 3 || countO == 3){
                return true
            }
        }
        return false
    }
    
    private func checkDiagonalsForWin() -> Bool{
        let centralMark = board[1][1].mark
        
        //Sliced for readability
        if (centralMark != Mark.Blank){
            if (centralMark == board[0][0].mark) && (centralMark == board[2][2].mark){
                return true
            }
            else if (centralMark == board[0][2].mark) && (centralMark == board[2][0].mark){
                return true
            }
        }
        return false
    }
}
