//
//  ViewController.swift
//  TicTacToe
//
//  Created by 2019_DEV_205 on 14/10/2019.
//  Copyright © 2019 2019_DEV_205. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var playerNameLabel: UILabel!
    
    @IBOutlet var ticTacToeButtons: [UIButton]!
    
    var gameEngine = GameEngine()
    var playerService = PlayerService(playerX: Player(name: "Player X", mark: Mark.X),playerO: Player(name: "Player O", mark: Mark.O))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCurrentPlayerLabel()
    }
    
    @IBAction func ticTacToeButtonPressed(_ sender: UIButton) {
        if gameEngine.isGameFinished
        {
            showStaticDialog(title: "Alert", body: "This game is finished, please start a new one.")
        }
        else{
            let move = Space(coordinate: Coordinate(tag:sender.tag), mark: playerService.currentPlayer.mark)
            
            let moveResult = gameEngine.process(potentialMove:move)
            switch moveResult {
            case MoveResult.Taken:
                showStaticDialog(title: "Alert", body: "This spot is already taken, please choose another one.")
                break
            case MoveResult.Win:
                sender.setImage(ImageHelper.getImageFor(mark:playerService.currentPlayer.mark), for: .normal)
                showStaticDialog(title: "Congratulations", body: playerService.currentPlayer.name + " wins!")
                break
            case MoveResult.Draw:
                sender.setImage(ImageHelper.getImageFor(mark:playerService.currentPlayer.mark), for: .normal)
                showStaticDialog(title: "Game over", body: "This game is a draw.")
                break
            case MoveResult.Valid:
                sender.setImage(ImageHelper.getImageFor(mark:playerService.currentPlayer.mark), for: .normal)
                playerService.switchCurrentPlayer()
                updateCurrentPlayerLabel()
                break
            case MoveResult.Invalid:
                showStaticDialog(title: "Alert", body: "Invalid move")
                break
            }
        }
    }
    
    @IBAction func relaunchButtonPressed(_ sender: Any) {
        gameEngine = GameEngine()
        clearButtonImages()
    }
    
    private func clearButtonImages(){
        for button in ticTacToeButtons{
            button.setImage(nil, for: .normal)
        }
    }
    
    func updateCurrentPlayerLabel(){
        playerNameLabel.text = playerService.currentPlayer?.name
    }
    
    func showStaticDialog(title:String, body:String) {
        let alertController = UIAlertController(title: title, message:
            body, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
}
