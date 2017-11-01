//
//  GamePlay.swift
//  Pulse
//
//  Created by Peter on 11/20/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import SpriteKit

var currentPulse: Pulse = Pulse()

func updateBalance() {
    balance.text = "\(coins) Coins"
}

func updateScoreboard() {
    scoreboard.text = "\(score)"
    highscoreLabel.text = "Best: \(highscore)"
    
    if score > highscore {
        highscore = score
        scoreboard.run(SKAction.scale(to: 1.25, duration: 0.5))
        scoreboard.fontColor = GameColor.Red.colorValue
        highscoreLabel.run(SKAction.scale(to: 1.25, duration: 0.5))
        highscoreLabel.fontColor = GameColor.Red.colorValue
    } else {
        scoreboard.fontColor = GameColor.White.colorValue
        scoreboard.xScale = 1
        scoreboard.yScale = 1
        highscoreLabel.fontColor = GameColor.White.colorValue
        highscoreLabel.xScale = 1
        highscoreLabel.yScale = 1
    }
}

var balance = SKLabelNode(fontNamed: "Futura")

fileprivate var scoreboard = SKLabelNode(fontNamed: "Futura")

fileprivate var highscoreLabel = SKLabelNode(fontNamed: "Futura")

var paused = false

class GamePlay: SKScene {
    
    override func didMove(to view: SKView) {
      
        score = 0
        
        self.backgroundColor = GameColor.Black.colorValue
        
        scoreboard = SKLabelNode(fontNamed: "Futura")
        
        scoreboard.text = "\(score)"
        scoreboard.position = CGPoint(x: 0, y: self.frame.midY+self.frame.maxY/2)
        scoreboard.fontSize = self.frame.maxY/4
        scoreboard.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        scoreboard.fontColor = GameColor.White.colorValue
        scoreboard.name = "scoreboard"
        scoreboard.zPosition = 1
        
        self.addChild(scoreboard)
        
        highscoreLabel = SKLabelNode(fontNamed: "Futura")
        
        highscoreLabel.text = "Best: \(highscore)"
        highscoreLabel.position = scoreboard.position.add(x: 0, y: -scoreboard.fontSize/4)
        highscoreLabel.fontSize = self.frame.maxY/16
        highscoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        highscoreLabel.fontColor = GameColor.White.colorValue
        highscoreLabel.name = "highscore"
        highscoreLabel.zPosition = 1
        
        self.addChild(highscoreLabel)

        balance = SKLabelNode(fontNamed: "Futura")
        
        balance.position = CGPoint(x: 0, y: self.frame.midY-self.frame.maxY/2)
        balance.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        balance.fontSize = self.frame.maxX/8
        balance.fontColor = GameColor.Yellow.colorValue
        balance.zPosition = 1
        
        self.addChild(balance)
        
        let pauseButton = Button(size: CGSize(width: self.frame.maxX/4, height: self.frame.maxX/4),
                                 name: "pause",
                                 position: CGPoint(x: self.frame.minX+self.frame.maxX/4/2+10, y: self.frame.maxY-self.frame.maxX/4/2-10),
                                 backgroundColor: GameColor.DarkGray.colorValue,
                                 backgroundImage: UIImage(named: "pause.png")!,
                                 parent: self
        )
        
        pauseButton.zPosition = 100
        
        updateBalance()
        
        spawnPulse(parent: self)
                
        self.name = "GamePlay"
        
    }
}
