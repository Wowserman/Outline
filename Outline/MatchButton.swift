//
//  MatchButton.swift
//  Outline
//
//  Created by Peter on 11/27/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

func checkMatching(scene: SKScene) {
    if currentPulse.isDrawingOutlined {
        
        if currentPulse.isDrawingPerfectlyOutlined {
            
            spawnPerfect(scene: scene)
            
            let random = Int(arc4random_uniform(4))+1
            var amplifier = 1
            var speed = 0.3

            if currentPulse.getSkin()==Skins.Coin {
                amplifier = 10
                speed = 0.1
            }
            
            scene.run(
                SKAction.repeat(
                    SKAction.sequence([
                        SKAction.run({
                            spawnCoin(scene: scene)
                        }),
                        SKAction.wait(forDuration: speed)
                        ]), count: random*amplifier))
        }
        
        currentPulse.kill()
        spawnPulse(parent: scene)
        
        score += 1
        updateScoreboard()
        
    } else {
        // Pulse is not outlined, User has Lost.
        currentPulse.kill()
        endGame(scene: scene)
    }
}
