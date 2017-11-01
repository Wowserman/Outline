//
//  Pause.swift
//  Outline
//
//  Created by Peter on 12/22/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

var pauseButtons = [Button]()

func pause(scene: SKScene) {
    // Check if the Game is Paused Already
    if paused == true {
        // Game is Paused Already, Return out of this Function.
        return
    }
    
    // Game isn't Paused. Continue on.
    paused = true
    
    // Pause the CurrentPulse, to prevent it from animating.
    currentPulse.setPaused(toValue: true)
    
    // Hide all Previous Nodes on the Screen.
    scene.allChildrenRun(action: moveOutLeft)
    
    
    // Create all of the Buttons for the Pause Menu (Still on the Same Scene)
    
    let continueGame = Button(size: CGSize(width: scene.frame.maxX, height: scene.frame.maxX/4),
                          text: "Continue",
                          position: CGPoint(x: scene.frame.midX, y: scene.frame.maxY-scene.frame.maxY/2*1.5),
                          backgroundColor: GameColor.Yellow.colorValue,
                          parent: scene)
    
    let shop = Button(size: CGSize(width: scene.frame.maxX, height: scene.frame.maxX/4),
                              text: "Shop",
                              position: CGPoint(x: scene.frame.midX, y: scene.frame.maxY-scene.frame.maxY/2*2),
                              backgroundColor: GameColor.Yellow.colorValue,
                              parent: scene)
    
    let home = Button(size: CGSize(width: scene.frame.maxX, height: scene.frame.maxX/4),
                              text: "Home",
                              position: CGPoint(x: scene.frame.midX, y: scene.frame.maxY-scene.frame.maxY/2*2.5),
                              backgroundColor: GameColor.Yellow.colorValue,
                              parent: scene)
    
    let help = Button(size: CGSize(width: scene.frame.maxX, height: scene.frame.maxX/4),
                      text: "Help",
                      position: CGPoint(x: scene.frame.midX, y: scene.frame.maxY-scene.frame.maxY/2*3),
                      backgroundColor: GameColor.Yellow.colorValue,
                      parent: scene)
    
    pauseButtons.append(contentsOf: [continueGame, shop, home, help])
    
    for button in pauseButtons {
        button.run(action: moveInLeft)
        button.zPosition = 5
    }
}
