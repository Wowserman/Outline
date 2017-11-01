//
//  Continue.swift
//  Outline
//
//  Created by Peter on 12/22/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

func unpause(scene: SKScene) {
    // Check if the Game isn't Paused.
    if paused == false {
        // Game isn't Paused, Return out of this Function.
        return
    }
    
    // Game isn't Paused. Continue on.
    paused = false
    
    // Hide all the Pause Buttons
    
    for button in pauseButtons {
        button.run(action: SKAction.sequence([moveOutRight, SKAction.run { button.kill() }]))
    }
    
    // Show all of the other nodes
    scene.allChildrenRun(action: SKAction.sequence([SKAction.wait(forDuration: 0.5), moveInRight]))
    
    // Clear pauseButtons
    pauseButtons.removeAll()
    
    // Un-Pause the Current Pulse
    currentPulse.setPaused(toValue: false)
}
