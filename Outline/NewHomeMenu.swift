//
//  NewHomeMenu.swift
//  Outline
//
//  Created by Peter on 12/20/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

class NewHomeMenu: SKScene {
    
    var logo: Pulse? = nil
    
    var play: Button? = nil
    
    var shop: Button? = nil
    
    var help: Button? = nil
    
    var credits: Button? = nil
    
    var buttons: [Button] = [Button]()
    
    override func didMove(to view: SKView) {
        self.setBackgroundGradient(
            topColor: UIColor(red: 0, green: 253/255, blue: 255/255, alpha: 1),
            bottomColor: UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 1)
        )
        
        logo = Pulse(parent: self
            , position: CGPoint(x: self.frame.midX, y: self.frame.maxY-self.frame.maxY/2*0.5)
            , type: PulseType.OutlineLogo
            , actionType: ActionType.random())
        
        logo?.drawingSize = CGSize(width: self.frame.maxX*1.5, height: self.frame.maxX*1.5/4)
        logo?.outlineSize = logo!.drawingSize
        
        currentPulse = logo!

        currentPulse.stopActions()
        currentPulse.animate()
        
        play = Button(
            size: CGSize(width: self.frame.maxX, height: self.frame.maxX/4),
            text: "Play",
            position: CGPoint(x: self.frame.midX, y: self.frame.maxY-self.frame.maxY/2*1.5),
            backgroundColor: GameColor.SkyBlue.colorValue,
            parent: self
        )
        
        shop = Button(
            size: CGSize(width: self.frame.maxX, height: self.frame.maxX/4),
            text: "Shop",
            position: CGPoint(x: self.frame.midX, y: self.frame.maxY-self.frame.maxY/2*2),
            backgroundColor: GameColor.BananaYellow.colorValue,
            parent: self
        )
        
        help = Button(
            size: CGSize(width: self.frame.maxX, height: self.frame.maxX/4),
            text: "Help",
            position: CGPoint(x: self.frame.midX, y: self.frame.maxY-self.frame.maxY/2*2.5),
            backgroundColor: GameColor.NullRed.colorValue,
            parent: self
        )
        
        credits = Button(
            size: CGSize(width: self.frame.maxX, height: self.frame.maxX/4),
            text: "Credits",
            position: CGPoint(x: self.frame.midX, y: self.frame.maxY-self.frame.maxY/2*3),
            backgroundColor: GameColor.BugGreen.colorValue,
            parent: self
        )

        buttons = [play!, shop!, help!, credits!]
        
        for button in buttons {
            button.zPosition = 5
            button.run(action: Animation.PopUp.action)
        }
    }
    
    
}
