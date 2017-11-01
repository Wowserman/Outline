//
//  Continue.swift
//  Outline
//
//  Created by Peter on 11/27/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

func continueGame(scene: SKScene) {
    killPauseButtons(scene: scene)
    scene.run(
        SKAction.sequence(
            [SKAction.wait(forDuration: 1),
             SKAction.run({
                showGamePlayNodes(scene: scene)
             })]
        )
    )
}
