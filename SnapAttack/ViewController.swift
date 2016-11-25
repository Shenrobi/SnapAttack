//
//  ViewController.swift
//  SnapAttack
//
//  Created by Terrell Robinson on 11/11/16.
//  Copyright © 2016 FlyGoody. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var firstCard: UIImageView!
    @IBOutlet weak var secondCard: UIImageView!
    
    @IBOutlet weak var gameButton: UIButton!
    
    var gameTimer = Timer()
    var cardTimer = Timer()
    
    var timerInt = 0
    var scoreInt = 0
    var gameMode = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerInt = 99
        timeLabel.text = String("Time: \(timerInt)")
        
        scoreInt = 0
        scoreLabel.text = String("Score: \(scoreInt)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func gameButtonPressed(_ sender: Any) {
        
        startGame()
        
    }
    
    
    func startGame() {
        
        if timerInt == 99 {
            
            gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
            
            cardTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateCards), userInfo: nil, repeats: true)
            
            gameButton.isEnabled = false
            gameButton.alpha = 0.5
            gameButton.setTitle("SNAP!", for: .normal)
            
            
        } else if timerInt == 0 {
            
            scoreInt = 0
            scoreLabel.text = String("Score: \(scoreInt)")
            
            timerInt = 99
            timeLabel.text = String("Score: \(timerInt)")
            
            gameButton.setTitle("START", for: .normal)
            
        }
        
        if gameMode == 1 {
            
            if firstCard.image == secondCard.image {
                
                scoreInt += 100
                scoreLabel.text = String("Score: \(scoreInt)")
                
            } else {
                
                scoreInt -= 50
                scoreLabel.text = String("Score: \(scoreInt)")
                
            }
            
        }
        
        
    }
    
    
    
    func updateTimer() {
        
        timerInt -= 1
        timeLabel.text = String("Time: \(timerInt)")
        
        gameButton.isEnabled = true
        gameButton.alpha = 1.0
        
        gameMode = 1
        
        if timerInt == 0 {
            
            gameTimer.invalidate()
            cardTimer.invalidate()
            
            firstCard.image = UIImage(named: "blue_cover.png")
            secondCard.image = UIImage(named: "blue_cover.png")
            
            
            gameMode = 0
            
            gameButton.setTitle("RESTART", for: .normal)
        }
        
        
    }
    
    func updateCards() {
        
        let cardList = ["ace_of_hearts.png", "king_of_hearts.png", "king_of_hearts2.png", "queen_of_hearts.png", "queen_of_hearts2.png", "jack_of_hearts.png", "jack_of_hearts2.png", "2_of_hearts.png", "3_of_hearts.png", "4_of_hearts.png", "5_of_hearts.png", "6_of_hearts.png", "7_of_hearts.png", "8_of_hearts.png", "9_of_hearts.png", "10_of_hearts.png"]
        
        let randomCardGeneratorOne = Int(arc4random_uniform(UInt32(cardList.count)))
        firstCard.image = UIImage(named: cardList[randomCardGeneratorOne])
        
        let randomCardGeneratorTwo = Int(arc4random_uniform(UInt32(cardList.count)))
        secondCard.image = UIImage(named: cardList[randomCardGeneratorTwo])
        
    }
    
    
    
}

