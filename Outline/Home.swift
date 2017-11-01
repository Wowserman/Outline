//
//  Home.swift
//  Pulse
//
//  Created by Peter on 11/25/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

class Home: SKScene {
    
    var logo: Pulse? = nil
    
    var play: Button? = nil
    
    var shop: Button? = nil
    
    var help: Button? = nil
    
    var mute: Button? = nil
    
    var buttons: [Button] = [Button]()
    
    let highscoreLabel = SKLabelNode(fontNamed: "Futura")
    
    override func didMove(to view: SKView) {
        self.name = "Home"
        
        paused = false
        
//        topColor: UIColor(red: 0, green: 253/255, blue: 255/255, alpha: 1),
//        bottomColor: UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 1)
        
        self.backgroundColor = GameColor.Black.colorValue
        
        logo = Pulse(parent: self
            , position: CGPoint(x: self.frame.midX, y: self.frame.maxY-self.frame.maxY/2)
            , type: PulseType.OutlineLogo
            , actionType: ActionType.blink)
        
        logo?.drawingSize = CGSize(width: self.frame.maxX*1.5, height: self.frame.maxX*1.5/4)
        logo?.outlineSize = logo!.drawingSize
        
        currentPulse = logo!
        
        play = Button(
            size: CGSize(width: self.frame.maxX*1.5, height: self.frame.maxX/2),
            name: "Play",
            position: CGPoint(x: self.frame.midX, y: self.frame.midY),
            backgroundColor: GameColor.Cyan.colorValue,
            backgroundImage: UIImage(named: "play.png")!,
            parent: self
        )
        
        shop = Button(
            size: CGSize(width: self.frame.maxX/3, height: self.frame.maxX/3),
            name: "Shop",
            position: CGPoint(x: self.frame.midX, y: self.frame.midY-self.frame.maxX/2),
            backgroundColor: GameColor.Yellow.colorValue,
            backgroundImage: UIImage(named: "shop.png")!,
            parent: self
        )
        
        help = Button(
            size: CGSize(width: self.frame.maxX/3, height: self.frame.maxX/3),
            name: "Help",
            position: CGPoint(x: self.frame.midX+self.frame.maxX/2, y: self.frame.midY-self.frame.maxX/2),
            backgroundColor: GameColor.Red.colorValue,
            backgroundImage: UIImage(named: "help.png")!,
            parent: self
        )
        
        mute = Button(
            size: CGSize(width: self.frame.maxX/3, height: self.frame.maxX/3),
            name: "Mute",
            position: CGPoint(x: self.frame.midX-self.frame.maxX/2, y: self.frame.midY-self.frame.maxX/2),
            backgroundColor: GameColor.Orange.colorValue,
            backgroundImage: muteImage,
            parent: self
        )
        
        highscoreLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY-self.frame.maxX)
        highscoreLabel.fontSize = self.frame.maxX/8
        highscoreLabel.fontColor = GameColor.White.colorValue
        highscoreLabel.text = "Best: \(highscore)"
        self.addChild(highscoreLabel)
        
        buttons = [play!, shop!, help!, mute!]
        
        for button in buttons {
            button.zPosition = 5
        }
    }
}

































