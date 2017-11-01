//
//  RestartGameButton.swift
//  Outline
//
//  Created by Peter on 11/27/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

func restartGame(scene: SKScene) {
    killPauseButtons(scene: scene)
    scene.run(
        SKAction.sequence(
            [SKAction.wait(forDuration: 1),
             SKAction.run({
                
                showGamePlayNodes(scene: scene)
                
                currentPulse.kill()
                spawnPulse(parent: scene)
                
                score = 0
                updateScoreboard()
             })]
        )
    )
}
