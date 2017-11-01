//
//  EndGame.swift
//  Outline
//
//  Created by Peter on 11/27/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

fileprivate var scoreLabel: SKLabelNode = SKLabelNode(fontNamed: "Futura")

fileprivate var highscoreLabel: SKLabelNode = SKLabelNode(fontNamed: "Futura")

class EndGame: SKScene {
    
    var play: Button? = nil
    
    var home: Button? = nil
    
    var shop: Button? = nil
    
    var help: Button? = nil
    
    var mute: Button? = nil
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = GameColor.Black.colorValue
        
        scoreLabel = SKLabelNode(fontNamed: "Futura")
        
        scoreLabel.text = "\(score)"
        scoreLabel.position = CGPoint(x: 0, y: self.frame.midY+self.frame.maxY/2)
        scoreLabel.fontSize = self.frame.maxY/4
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        scoreLabel.fontColor = GameColor.White.colorValue
        scoreLabel.name = "scoreboard"
        scoreLabel.zPosition = 1
        
        self.addChild(scoreLabel)
        
        highscoreLabel = SKLabelNode(fontNamed: "Futura")
        
        highscoreLabel.text = "Best: \(highscore)"
        highscoreLabel.position = scoreLabel.position.add(x: 0, y: -scoreLabel.fontSize/4)
        highscoreLabel.fontSize = self.frame.maxY/16
        highscoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        highscoreLabel.fontColor = GameColor.White.colorValue
        highscoreLabel.name = "highscore"
        highscoreLabel.zPosition = 1
        
        self.addChild(highscoreLabel)
        
        play = Button(
            size: CGSize(width: self.frame.maxX*1.5, height: self.frame.maxX/2),
            name: "Play",
            position: CGPoint(x: self.frame.midX, y: self.frame.midY+self.frame.maxX/6),
            backgroundColor: GameColor.Cyan.colorValue,
            backgroundImage: UIImage(named: "play.png")!,
            parent: self
        )
        
        home = Button(
            size: CGSize(width: self.frame.maxX*1.5, height: self.frame.maxX/3),
            text: "Home",
            position: CGPoint(x: self.frame.midX, y: self.frame.midY-self.frame.maxX/3),
            backgroundColor: GameColor.Green.colorValue,
            parent: self
        )
        
        shop = Button(
            size: CGSize(width: self.frame.maxX/3, height: self.frame.maxX/3),
            name: "Shop",
            position: CGPoint(x: self.frame.midX, y: self.frame.midY-self.frame.maxX/2-self.frame.maxX/4),
            backgroundColor: GameColor.Yellow.colorValue,
            backgroundImage: UIImage(named: "shop.png")!,
            parent: self
        )
        
        help = Button(
            size: CGSize(width: self.frame.maxX/3, height: self.frame.maxX/3),
            name: "Help",
            position: CGPoint(x: self.frame.midX+self.frame.maxX/2, y: self.frame.midY-self.frame.maxX/2-self.frame.maxX/4),
            backgroundColor: GameColor.Red.colorValue,
            backgroundImage: UIImage(named: "help.png")!,
            parent: self
        )
        
        mute = Button(
            size: CGSize(width: self.frame.maxX/3, height: self.frame.maxX/3),
            name: "Mute",
            position: CGPoint(x: self.frame.midX-self.frame.maxX/2, y: self.frame.midY-self.frame.maxX/2-self.frame.maxX/4),
            backgroundColor: GameColor.Orange.colorValue,
            backgroundImage: muteImage,
            parent: self
        )
    }
}
